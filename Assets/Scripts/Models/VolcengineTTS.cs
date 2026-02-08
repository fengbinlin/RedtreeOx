using UnityEngine;
using UnityEngine.Networking;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

[RequireComponent(typeof(AudioSource))]
public class VolcTTSClient : MonoBehaviour
{
    [Header("API 凭据")]
    public string appId;
    public string accessToken;
    public string resourceId = "seed-tts-2.0";

    [Header("TTS 参数")]
    public string speaker = "saturn_zh_male_shuanglangshaonian_tob";
    [Range(-50, 100)] public int speechRate = 0;

    [Header("测试控制 (按F2)")]
    [TextArea(3, 5)]
    public string testText = "采样率自适应已开启。无论你的系统是48000还是44100，现在的音调都应该是正常的。";

    private AudioSource audioSource;
    private UnityWebRequest currentRequest;

    // --- 采样率同步关键变量 ---
    private const int SourceSampleRate = 24000; // 火山返回的固定采样率
    private int systemSampleRate;               // Unity系统的实际输出采样率
    private readonly Queue<float> _streamingBuffer = new Queue<float>();
    private bool _isDataIncoming = false;
    private float _samplePointer = 0f;          // 用于重采样的指针

    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        // 获取当前运行设备的实际采样率 (如 48000)
        systemSampleRate = AudioSettings.outputSampleRate;

        // 创建一个空的音频片段挂载，确保 OnAudioFilterRead 执行
        audioSource.clip = AudioClip.Create("Streaming", systemSampleRate, 1, systemSampleRate, false);
        audioSource.loop = true;
        audioSource.Play();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.F2)) Speak(testText);
    }


    // --- 主要接口：开始合成并播放 ---
    public void Speak(string text)
    {
        StopAllCoroutines();
        if (currentRequest != null) { currentRequest.Abort(); currentRequest.Dispose(); }

        lock (_streamingBuffer)
        {
            _streamingBuffer.Clear();
            _samplePointer = 0f;
        }
        _isDataIncoming = true;
        StartCoroutine(RequestTTS(text));
    }

    IEnumerator RequestTTS(string text)
    {
        string url = "https://openspeech.bytedance.com/api/v3/tts/unidirectional";
        string jsonPayload = "{\"user\":{\"uid\":\"unity\"},\"req_params\":{\"text\":\"" + text +
                             "\",\"speaker\":\"" + speaker +
                             "\",\"audio_params\":{\"format\":\"pcm\",\"sample_rate\":" + SourceSampleRate +
                             ",\"speech_rate\":" + speechRate + "}}}";

        currentRequest = new UnityWebRequest(url, "POST");
        currentRequest.uploadHandler = new UploadHandlerRaw(Encoding.UTF8.GetBytes(jsonPayload));
        currentRequest.downloadHandler = new TTSStreamHandler(_streamingBuffer);

        currentRequest.SetRequestHeader("Content-Type", "application/json");
        currentRequest.SetRequestHeader("X-Api-App-Id", appId.Trim());
        currentRequest.SetRequestHeader("X-Api-Access-Key", accessToken.Trim());
        currentRequest.SetRequestHeader("X-Api-Resource-Id", resourceId.Trim());

        yield return currentRequest.SendWebRequest();
        _isDataIncoming = false;
    }

    // --- 核心修复：带比率转换的音频读取 ---
    void OnAudioFilterRead(float[] data, int channels)
    {
        // 计算转换比率 (例如 24000 / 48000 = 0.5)
        float playbackSpeed = (float)SourceSampleRate / systemSampleRate;

        lock (_streamingBuffer)
        {
            for (int i = 0; i < data.Length; i += channels)
            {
                float sample = 0;

                // 只有当缓冲区足够大，或者数据已经传输完毕时才开始消费
                if (_streamingBuffer.Count > 1000 || (!_isDataIncoming && _streamingBuffer.Count > 0))
                {
                    // 模拟重采样：根据比率步进指针
                    if (_streamingBuffer.Count > 0)
                    {
                        sample = GetNextSampleWithRatio(playbackSpeed);
                    }
                }

                for (int c = 0; c < channels; c++)
                {
                    data[i + c] = sample;
                }
            }
        }
    }

    // 根据比率从队列中取样，实现简单的线性降采样/升采样
    float GetNextSampleWithRatio(float ratio)
    {
        _samplePointer += ratio;
        float currentSample = 0;

        // 当指针累积超过 1 时，从队列里真正弹出一个数据
        while (_samplePointer >= 1.0f)
        {
            if (_streamingBuffer.Count > 0)
                currentSample = _streamingBuffer.Dequeue();
            _samplePointer -= 1.0f;
        }
        return currentSample;
    }

    private class TTSStreamHandler : DownloadHandlerScript
    {
        private Queue<float> _bufferQueue;
        private StringBuilder _jsonBuffer = new StringBuilder();

        public TTSStreamHandler(Queue<float> queue) : base(new byte[64 * 1024]) { _bufferQueue = queue; }

        protected override bool ReceiveData(byte[] data, int length)
        {
            _jsonBuffer.Append(Encoding.UTF8.GetString(data, 0, length));
            string[] lines = _jsonBuffer.ToString().Split('\n');
            for (int i = 0; i < lines.Length - 1; i++)
            {
                try
                {
                    var res = JsonUtility.FromJson<TTSRes>(lines[i]);
                    if (res != null && !string.IsNullOrEmpty(res.data))
                    {
                        byte[] pcm = Convert.FromBase64String(res.data);
                        lock (_bufferQueue)
                        {
                            for (int j = 0; j < pcm.Length / 2; j++)
                            {
                                _bufferQueue.Enqueue(BitConverter.ToInt16(pcm, j * 2) / 32768f);
                            }
                        }
                    }
                }
                catch { }
            }
            _jsonBuffer.Clear();
            _jsonBuffer.Append(lines[lines.Length - 1]);
            return true;
        }
        [Serializable] class TTSRes { public string data; }
    }
}