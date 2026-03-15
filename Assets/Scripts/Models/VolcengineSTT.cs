using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using Newtonsoft.Json; // 建议安装 Newtonsoft Json 以方便解析
using System.IO;

public class VolcASRController : MonoBehaviour
{
    [Header("火山引擎配置")]
    public string appId = "你的AppID";
    public string accessToken = "你的AccessToken";
    public string resourceId = "volc.bigasr.auc_turbo";

    private string apiUrl = "https://openspeech.bytedance.com/api/v3/auc/bigmodel/recognize/flash";
    private AudioClip recordingClip;
    private float startTime;
    private string deviceName;

    void Start()
    {
        // 获取默认录音设备
        if (Microphone.devices.Length > 0)
        {
            deviceName = Microphone.devices[0];
        }
        else
        {
            Debug.LogError("未找到录音设备！");
        }
    }

    void Update()
    {
        // 按住 F1 开始录音
        if (Input.GetKeyDown(KeyCode.F1))
        {
            StartRecording();
        }

        // 松开 F1 停止录音并上传
        if (Input.GetKeyUp(KeyCode.F1))
        {
            StopAndUpload();
        }
    }

    private void StartRecording()
    {
        Debug.Log("开始录音...");
        // 设置最大录音时长为 60 秒，采样率 16000 (ASR常用采样率)
        recordingClip = Microphone.Start(deviceName, false, 60, 16000);
        startTime = Time.time;
    }

    private void StopAndUpload()
    {
        if (!Microphone.IsRecording(deviceName)) return;

        int recordingLength = (int)((Time.time - startTime) * 16000);
        Microphone.End(deviceName);
        Debug.Log($"录音结束，长度: {Time.time - startTime:F2}s，准备上传...");

        // 裁剪音频并转为 WAV 字节流
        byte[] audioData = AudioToWavBytes(recordingClip, recordingLength);

        // 开启协程上传
        StartCoroutine(UploadAudioRoutine(audioData));
    }

    IEnumerator UploadAudioRoutine(byte[] audioData)
    {
        string base64Audio = Convert.ToBase64String(audioData);

        // 构建请求体
        var requestData = new
        {
            user = new { uid = appId },
            audio = new { data = base64Audio },
            request = new { model_name = "bigmodel" }
        };

        string jsonPayload = JsonConvert.SerializeObject(requestData);

        using (UnityWebRequest request = new UnityWebRequest(apiUrl, "POST"))
        {
            byte[] bodyRaw = System.Text.Encoding.UTF8.GetBytes(jsonPayload);
            request.uploadHandler = new UploadHandlerRaw(bodyRaw);
            request.downloadHandler = new DownloadHandlerBuffer();
            request.SetRequestHeader("Content-Type", "application/json");

            // 设置火山引擎要求的 Header
            request.SetRequestHeader("X-Api-App-Key", appId);
            request.SetRequestHeader("X-Api-Access-Key", accessToken);
            request.SetRequestHeader("X-Api-Resource-Id", resourceId);
            request.SetRequestHeader("X-Api-Request-Id", Guid.NewGuid().ToString());
            request.SetRequestHeader("X-Api-Sequence", "-1");

            yield return request.SendWebRequest();

            if (request.result == UnityWebRequest.Result.Success)
            {
                Debug.Log("服务器响应: " + request.downloadHandler.text);
                ParseResult(request.downloadHandler.text);
            }
            else
            {
                Debug.LogError("上传失败: " + request.error);
                Debug.LogError("错误信息: " + request.downloadHandler.text);
            }
        }
    }

    private void ParseResult(string jsonResponse)
    {
        try
        {
            // 简单解析结果中的 text 字段
            var response = JsonConvert.DeserializeObject<dynamic>(jsonResponse);
            string recognizedText = response.result.text;
            Debug.Log($"<color=green>识别结果：{recognizedText}</color>");
        }
        catch (Exception e)
        {
            Debug.LogError("解析JSON失败: " + e.Message);
        }
    }

    // 将 AudioClip 转换为标准的 WAV 格式字节数组（火山引擎支持 WAV）
    private byte[] AudioToWavBytes(AudioClip clip, int length)
    {
        float[] samples = new float[length * clip.channels];
        clip.GetData(samples, 0);

        using (MemoryStream outStream = new MemoryStream())
        using (BinaryWriter writer = new BinaryWriter(outStream))
        {
            short channels = (short)clip.channels;
            int hz = clip.frequency;

            writer.Write(new char[4] { 'R', 'I', 'F', 'F' });
            writer.Write(36 + samples.Length * 2);
            writer.Write(new char[4] { 'W', 'A', 'V', 'E' });
            writer.Write(new char[4] { 'f', 'm', 't', ' ' });
            writer.Write(16);
            writer.Write((short)1);
            writer.Write(channels);
            writer.Write(hz);
            writer.Write(hz * channels * 2);
            writer.Write((short)(channels * 2));
            writer.Write((short)16);
            writer.Write(new char[4] { 'd', 'a', 't', 'a' });
            writer.Write(samples.Length * 2);

            foreach (var sample in samples)
            {
                writer.Write((short)(sample * short.MaxValue));
            }
            return outStream.ToArray();
        }
    }
}