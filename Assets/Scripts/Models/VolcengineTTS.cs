using UnityEngine;
using UnityEngine.Networking;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;

[RequireComponent(typeof(AudioSource))]
public class VolcTTSClient : MonoBehaviour
{
    [Header("API ƾ��")]
    public string appId="6478715526";
    public string accessToken="FTsrazn8vMy_ndWuwsltJz81XfQw2Pvy";
    public string resourceId = "volc.bigasr.auc_turbo";

    [Header("TTS ����")]
    public string speaker = "saturn_zh_male_shuanglangshaonian_tob";
    [Range(-50, 100)] public int speechRate = 0;

    [Header("���Կ��� (��F2)")]
    [TextArea(3, 5)]
    public string testText = "����������Ӧ�ѿ������������ϵͳ��48000����44100�����ڵ�������Ӧ���������ġ�";

    private AudioSource audioSource;
    private UnityWebRequest currentRequest;

    // --- ������ͬ���ؼ����� ---
    private const int SourceSampleRate = 24000; // ��ɽ���صĹ̶�������
    private int systemSampleRate;               // Unityϵͳ��ʵ�����������
    private readonly Queue<float> _streamingBuffer = new Queue<float>();
    private bool _isDataIncoming = false;
    private float _samplePointer = 0f;          // �����ز�����ָ��

    void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        // ��ȡ��ǰ�����豸��ʵ�ʲ����� (�� 48000)
        systemSampleRate = AudioSettings.outputSampleRate;

        // ����һ���յ���ƵƬ�ι��أ�ȷ�� OnAudioFilterRead ִ��
        audioSource.clip = AudioClip.Create("Streaming", systemSampleRate, 1, systemSampleRate, false);
        audioSource.loop = true;
        audioSource.Play();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.F2)) Speak(testText);
    }


    // --- ��Ҫ�ӿڣ���ʼ�ϳɲ����� ---
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

    // --- �����޸���������ת������Ƶ��ȡ ---
    void OnAudioFilterRead(float[] data, int channels)
    {
        // ����ת������ (���� 24000 / 48000 = 0.5)
        float playbackSpeed = (float)SourceSampleRate / systemSampleRate;

        lock (_streamingBuffer)
        {
            for (int i = 0; i < data.Length; i += channels)
            {
                float sample = 0;

                // ֻ�е��������㹻�󣬻��������Ѿ��������ʱ�ſ�ʼ����
                if (_streamingBuffer.Count > 1000 || (!_isDataIncoming && _streamingBuffer.Count > 0))
                {
                    // ģ���ز��������ݱ��ʲ���ָ��
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

    // ���ݱ��ʴӶ�����ȡ����ʵ�ּ򵥵����Խ�����/������
    float GetNextSampleWithRatio(float ratio)
    {
        _samplePointer += ratio;
        float currentSample = 0;

        // ��ָ���ۻ����� 1 ʱ���Ӷ�������������һ������
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