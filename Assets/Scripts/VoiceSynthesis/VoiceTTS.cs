using UnityEngine;
using UnityEngine.Networking;
using System;
using System.Text;
using System.Collections;
using Newtonsoft.Json;

namespace LKZ.VoiceSynthesis
{
    public static class VoiceTTS
    {
        public const string appId = "6478715526";
        public const string accessToken = "FTsrazn8vMy_ndWuwsltJz81XfQw2Pvy";
        public const string resourceId = "seed-tts-1.0";
        public const string speaker = "zh_male_livelybro_mars_bigtts";

        private static TTSAudioPlayer audioPlayer;

        static VoiceTTS()
        {
            GameObject go = new GameObject("TTS_Downloader");
            UnityEngine.Object.DontDestroyOnLoad(go);
            audioPlayer = go.AddComponent<TTSAudioPlayer>();
        }

        public static void StartStreamingSynthesis(string text, Action<float[]> onDataReceived, Action onComplete)
        {
            audioPlayer.StartCoroutine(audioPlayer.RequestTTSStream(text, onDataReceived, onComplete));
        }

        private class TTSAudioPlayer : MonoBehaviour
        {
            private const int SourceSampleRate = 24000;

            public IEnumerator RequestTTSStream(string text, Action<float[]> onDataReceived, Action onComplete)
            {
                string url = "https://openspeech.bytedance.com/api/v3/tts/unidirectional";
                var payload = new {
                    user = new { uid = "unity" },
                    req_params = new {
                        text = text,
                        speaker = VoiceTTS.speaker,
                        audio_params = new { format = "pcm", sample_rate = SourceSampleRate }
                    }
                };

                using (UnityWebRequest request = new UnityWebRequest(url, "POST"))
                {
                    byte[] bodyRaw = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(payload));
                    request.uploadHandler = new UploadHandlerRaw(bodyRaw);
                    request.downloadHandler = new TTSStreamHandler(onDataReceived);

                    request.SetRequestHeader("Content-Type", "application/json");
                    request.SetRequestHeader("X-Api-App-Id", appId);
                    request.SetRequestHeader("X-Api-Access-Key", accessToken);
                    request.SetRequestHeader("X-Api-Resource-Id", resourceId);

                    yield return request.SendWebRequest();

                    if (request.result != UnityWebRequest.Result.Success)
                        Debug.LogError($"[TTS] 请求失败: {request.error}");
                    
                    onComplete?.Invoke();
                }
            }

            private class TTSStreamHandler : DownloadHandlerScript
            {
                private Action<float[]> onDataReceived;
                private StringBuilder jsonBuffer = new StringBuilder();

                public TTSStreamHandler(Action<float[]> callback) : base(new byte[64 * 1024]) 
                { 
                    onDataReceived = callback; 
                }

                protected override bool ReceiveData(byte[] data, int length)
                {
                    string segment = Encoding.UTF8.GetString(data, 0, length);
                    jsonBuffer.Append(segment);
                    
                    string fullContent = jsonBuffer.ToString();
                    int lastNewLine = fullContent.LastIndexOf('\n');

                    if (lastNewLine != -1)
                    {
                        string processable = fullContent.Substring(0, lastNewLine);
                        jsonBuffer.Remove(0, lastNewLine + 1);

                        string[] lines = processable.Split('\n');
                        foreach (var line in lines)
                        {
                            if (string.IsNullOrWhiteSpace(line)) continue;
                            ProcessJsonLine(line);
                        }
                    }
                    return true;
                }

                private void ProcessJsonLine(string json)
                {
                    try {
                        var res = JsonConvert.DeserializeObject<TTSRes>(json);
                        if (res != null && !string.IsNullOrEmpty(res.data))
                        {
                            byte[] pcm = Convert.FromBase64String(res.data);
                            float[] samples = new float[pcm.Length / 2];
                            for (int i = 0; i < samples.Length; i++)
                            {
                                samples[i] = BitConverter.ToInt16(pcm, i * 2) / 32768f;
                            }
                            onDataReceived?.Invoke(samples);
                        }
                    } catch { }
                }

                [Serializable] private class TTSRes { public string data; }
            }
        }
    }
}