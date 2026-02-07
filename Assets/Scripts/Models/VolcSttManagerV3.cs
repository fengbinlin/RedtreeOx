using UnityEngine;
using System;
using System.IO;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;

/// 火山引擎 V3 流式 ASR（model_name=bigmodel，返回流式中间结果）
/// F1 启动 / F2 停止 / Console 实时输出识别文本
public class VolcASRV3_Final : MonoBehaviour
{
    [Header("火山引擎鉴权")]
    public string AppKey;
    public string AccessKey;
    // 注意：请替换为你在控制台开通的真实资源 ID
    public string ResourceId = "volc.bigasr.sauc.duration";

    [Header("WebSocket")]
    // 如果文档给出其它标准地址，请改为文档的最新地址
    public string WssUrl = "wss://openspeech.bytedance.com/api/v3/sauc/bigmodel_async";

    [Header("音频")]
    public int SampleRate = 16000;
    public int FrameMs = 200;

    public KeyCode StartKey = KeyCode.F1;
    public KeyCode StopKey = KeyCode.F2;

    ClientWebSocket ws;
    CancellationTokenSource cts;

    AudioClip micClip;
    string micName;
    int frameSamples;
    float[] floatBuf;
    int lastMicPos;

    bool running;
    string connectId;
    string lastText = "";

    void Start()
    {
        frameSamples = SampleRate * FrameMs / 1000;
        floatBuf = new float[frameSamples];
        Debug.Log("[ASR] Ready. F1=start, F2=stop");
    }

    void Update()
    {
        if (Input.GetKeyDown(StartKey) && !running)
            StartASR();

        if (Input.GetKeyDown(StopKey) && running)
            StopASR();

        if (!running || micClip == null || ws == null || ws.State != WebSocketState.Open)
            return;

        int pos = Microphone.GetPosition(micName);
        int diff = pos - lastMicPos;
        if (diff < 0) diff += micClip.samples;

        while (diff >= frameSamples)
        {
            micClip.GetData(floatBuf, lastMicPos);
            lastMicPos = (lastMicPos + frameSamples) % micClip.samples;
            diff -= frameSamples;

            byte[] pcm = FloatToPCM16(floatBuf);
            _ = SendAudio(pcm, false);
        }
    }

    #region Start / Stop

    async void StartASR()
    {
        running = true;
        connectId = Guid.NewGuid().ToString();
        lastText = "";

        StartMic();
        await ConnectWS();
    }

    async void StopASR()
    {
        running = false;

        // 发送结束标志的空音频帧（flag 取值以文档为准，如果要求 0x01 请改成 0x01）
        if (ws != null && ws.State == WebSocketState.Open)
            await SendAudio(Array.Empty<byte>(), true);

        StopMic();
        cts?.Cancel();
        ws?.Dispose();
        ws = null;

        Debug.Log("[ASR] Stopped");
    }

    #endregion

    #region Microphone

    void StartMic()
    {
        if (Microphone.devices.Length == 0)
        {
            Debug.LogError("[ASR] No microphone found");
            running = false;
            return;
        }

        micName = Microphone.devices[0];
        Debug.Log($"[ASR] Using mic: {micName}");

        micClip = Microphone.Start(micName, true, 10, SampleRate);
        while (Microphone.GetPosition(micName) <= 0) { }

        Debug.Log($"[ASR] Mic started | freq={micClip.frequency}, ch={micClip.channels}");
        lastMicPos = 0;

        if (micClip.channels != 1)
            Debug.LogWarning("[ASR] 当前实现按单声道处理，如为多声道请自行下混到 mono。");
    }

    void StopMic()
    {
        if (!string.IsNullOrEmpty(micName))
            Microphone.End(micName);

        if (micClip != null)
            Destroy(micClip);

        micClip = null;
    }

    static byte[] FloatToPCM16(float[] src)
    {
        byte[] dst = new byte[src.Length * 2];
        for (int i = 0; i < src.Length; i++)
        {
            short v = (short)(Mathf.Clamp(src[i], -1f, 1f) * 32767);
            // 写入小端字节序
            dst[i * 2] = (byte)(v & 0xFF);
            dst[i * 2 + 1] = (byte)((v >> 8) & 0xFF);
        }
        return dst;
    }

    #endregion

    #region WebSocket

    async Task ConnectWS()
    {
        ws = new ClientWebSocket();
        cts = new CancellationTokenSource();

        // 鉴权头：请按文档与控制台配置为准，必要时补充 Timestamp/Signature/Token 等
        ws.Options.SetRequestHeader("X-Api-App-Key", AppKey);
        ws.Options.SetRequestHeader("X-Api-Access-Key", AccessKey);
        ws.Options.SetRequestHeader("X-Api-Resource-Id", ResourceId);
        ws.Options.SetRequestHeader("X-Api-Connect-Id", connectId);

        await ws.ConnectAsync(new Uri(WssUrl), cts.Token);
        Debug.Log("[ASR] WS connected");

        await SendInitRequest();
        _ = ReceiveLoop();
    }

    async Task SendInitRequest()
    {
        var req = new
        {
            user = new { uid = "unity_client" },
            audio = new { format = "pcm", rate = SampleRate, bits = 16, channel = 1 },
            request = new
            {
                // 根据文档：model_name 只有 "bigmodel"
                model_name = "bigmodel",
                enable_punc = true,
                enable_itn = true,
                // 需要流式中间结果
                result_type = "streaming"
            }
        };

        byte[] json = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(req));
        await SendBinary(0x01, 0x00, json); // msgType=0x01: init 请求；flag=0x00
        Debug.Log("[ASR] Init sent");
    }

    async Task SendAudio(byte[] pcm, bool last)
    {
        // flag 的具体取值请以文档为准，如结束标志要求 0x01 请对应调整
        byte flag = last ? (byte)0x02 : (byte)0x00;
        await SendBinary(0x02, flag, pcm); // msgType=0x02: 音频帧
    }

    // 按 SAUC v3 文档的二进制帧构造：
    // Byte0: version=0x10（协议版本 1.0）
    // Byte1: 高 4 位为 msgType；低 4 位为 flag
    // Byte2: serializer=0x01（JSON）
    // Byte3: compression=0x00（无压缩）
    // Byte4-7: payload 长度（uint32 BE）
    async Task SendBinary(byte msgType, byte flag, byte[] payload)
    {
        using var ms = new MemoryStream();

        ms.WriteByte(0x10);                              // 协议版本：1.0
        ms.WriteByte((byte)((msgType << 4) | (flag & 0x0F)));
        ms.WriteByte(0x01);                              // 序列化：JSON
        ms.WriteByte(0x00);                              // 压缩：无

        uint payloadLen = (uint)(payload?.Length ?? 0);
        // 写入 4 字节大端长度（不使用 Span/stackalloc）
        byte[] len = new byte[4];
        len[0] = (byte)((payloadLen >> 24) & 0xFF);
        len[1] = (byte)((payloadLen >> 16) & 0xFF);
        len[2] = (byte)((payloadLen >> 8) & 0xFF);
        len[3] = (byte)(payloadLen & 0xFF);
        ms.Write(len, 0, 4);

        if (payloadLen > 0)
            ms.Write(payload, 0, (int)payloadLen);

        var data = ms.ToArray();

        await ws.SendAsync(
            new ArraySegment<byte>(data),
            WebSocketMessageType.Binary,
            true,
            cts.Token
        );
    }

    async Task ReceiveLoop()
    {
        var buf = new byte[8192];

        while (ws.State == WebSocketState.Open && !cts.Token.IsCancellationRequested)
        {
            using var ms = new MemoryStream();

            WebSocketReceiveResult r;
            do
            {
                r = await ws.ReceiveAsync(new ArraySegment<byte>(buf), cts.Token);
                if (r.MessageType == WebSocketMessageType.Close)
                {
                    Debug.LogWarning($"[ASR] WS closed: {ws.CloseStatus} {ws.CloseStatusDescription}");
                    return;
                }
                if (r.MessageType != WebSocketMessageType.Binary)
                {
                    // 文档规定为二进制帧，这里直接忽略文本帧
                    continue;
                }
                ms.Write(buf, 0, r.Count);
            } while (!r.EndOfMessage);

            var frame = ms.ToArray();
            if (frame.Length < 8)
                continue;

            // 检查帧头（不使用 Span）
            byte version = frame[0];
            byte serializer = frame[2];
            if (version != 0x10 || serializer != 0x01)
            {
                Debug.LogWarning($"[ASR] Unexpected frame header v=0x{version:X2}, ser=0x{serializer:X2}");
                continue;
            }

            // 读取 4 字节大端长度（不使用 Span）
            uint len = (uint)(
                (frame[4] << 24) |
                (frame[5] << 16) |
                (frame[6] << 8) |
                (frame[7])
            );

            if (frame.Length < 8 + len)
            {
                Debug.LogWarning("[ASR] Incomplete frame payload");
                continue;
            }

            string json = Encoding.UTF8.GetString(frame, 8, (int)len);
            HandleResult(json);
        }
    }

    void HandleResult(string json)
    {
        Debug.Log($"[ASR RAW] {json}");

        try
        {
            dynamic obj = JsonConvert.DeserializeObject(json);

            // 流式中间结果与最终结果的示例字段
            string text =
                obj?.data?.result?.text ??      // 可能的中间/最终字段
                obj?.result?.text ??            // 另一种返回结构
                obj?.text;                      // 容错

            if (!string.IsNullOrEmpty(text) && text != lastText)
            {
                lastText = text;
                Debug.Log($"[ASR TEXT] {text}");
            }
        }
        catch (Exception e)
        {
            Debug.LogWarning($"[ASR] Parse error: {e.Message}");
        }
    }

    #endregion

    void OnDestroy()
    {
        if (running)
            StopASR();
    }
}