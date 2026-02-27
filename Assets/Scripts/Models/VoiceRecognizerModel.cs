using LKZ.Commands.Voice;
using LKZ.DependencyInject;
using LKZ.TypeEventSystem;
using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Networking;
using Newtonsoft.Json;
using System.IO;
using LKZ.Chat.Commands;
using LKZ.Commands.Chat;
using LKZ.Commands.Voice;
using LKZ.DependencyInject;
using LKZ.GPT;
using LKZ.Models;
using LKZ.TypeEventSystem;
using LKZ.VoiceSynthesis; // 引用 VoiceTTS 所在的命名空间
using NUnit.Framework;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LKZ.Manager;
namespace LKZ.Voice
{
    public sealed class VoiceRecognizerModel
    {
        [Inject] private MonoBehaviour _mono { get; set; }
        [Inject] private ISendCommand SendCommand { get; set; }
        [Inject] private IRegisterCommand RegisterCommand { get; set; }

        private VoiceRecognitionResultCommand voiceRecognitionResult = new VoiceRecognitionResultCommand();

        // 火山引擎配置
        private string appId = "6478715526";
        private string accessToken = "FTsrazn8vMy_ndWuwsltJz81XfQw2Pvy";
        private string resourceId = "volc.bigasr.auc_turbo";
        private string apiUrl = "https://openspeech.bytedance.com/api/v3/auc/bigmodel/recognize/flash";

        private string deviceName;
        private AudioClip micClip;
        private bool isRecogition;
        private int lastSamplePos = 0;

        // VAD 参数
        private float vadSampleWindow = 0.1f;
        private float noiseFloor = 0.005f;
        private float noiseAdaptSpeed = 0.1f;
        private float startFactor = 3.0f;
        private float endFactor = 1.5f;
        private float vadEndSilenceTime = 1.2f;

        private int recordingStartPos = 0;
        private float silenceTimer;

        private enum VADState { Idle, Speaking, Pause }
        private VADState vadState = VADState.Idle;
        private Coroutine vadCoroutineHandle;

        public void Initialized()
        {
            RegisterCommand.Register<SettingVoiceRecognitionCommand>(SettingVoiceRecognitionCommandCallback);

            if (Microphone.devices.Length > 0)
            {
                deviceName = Microphone.devices[0];
                micClip = Microphone.Start(deviceName, true, 100, 16000);
                Debug.Log($"[Init] 麦克风已就绪: {deviceName}");
            }
        }

        private void SettingVoiceRecognitionCommandCallback(SettingVoiceRecognitionCommand obj)
        {
            SetIsRecogition(obj.IsStartVoiceRecognition);
        }

        public void SetIsRecogition(bool isOn)
        {
            // 状态去重，防止重复开启协程
            if (this.isRecogition == isOn) return;

            this.isRecogition = isOn;
            Debug.Log($"[VAD] 监听状态切换: {isOn}");

            if (isOn)
            {
                if (vadCoroutineHandle == null)
                {
                    // 重置状态
                    vadState = VADState.Idle;
                    lastSamplePos = Microphone.GetPosition(deviceName);
                    vadCoroutineHandle = _mono.StartCoroutine(VADCoroutine());
                }
            }
            else
            {
                if (vadCoroutineHandle != null)
                {
                    _mono.StopCoroutine(vadCoroutineHandle);
                    vadCoroutineHandle = null;
                }
            }
        }

        IEnumerator VADCoroutine()
        {
            float[] sampleData = new float[(int)(vadSampleWindow * 16000)];

            while (isRecogition)
            {

                int currentPos = Microphone.GetPosition(deviceName);
                int diff = (currentPos - lastSamplePos + micClip.samples) % micClip.samples;

                if (diff >= sampleData.Length)
                {
                    // 获取数据
                    micClip.GetData(sampleData, lastSamplePos);
                    lastSamplePos = (lastSamplePos + sampleData.Length) % micClip.samples;

                    float rms = CalculateRMS(sampleData);

                    // 动态噪声基线
                    if (vadState == VADState.Idle)
                        noiseFloor = Mathf.Lerp(noiseFloor, rms, noiseAdaptSpeed);

                    float startTh = Mathf.Max(noiseFloor * startFactor, 0.002f);
                    float endTh = noiseFloor * endFactor;

                    switch (vadState)
                    {
                        case VADState.Idle:
                            if (rms > startTh)
                            {
                                vadState = VADState.Speaking;
                                // 回溯 0.3s 防止切头
                                recordingStartPos = (lastSamplePos - (int)(0.3f * 16000) + micClip.samples) % micClip.samples;
                                Debug.Log($"[VAD] 开始说话 (RMS:{rms:F4})");
                                GameApp.instance.tips.text="红岭牛听到你的提问了！";
                            }
                            else
                            {
                                GameApp.instance.tips.text="请语音提问，红岭牛在倾听！";
                            }
                            break;

                        case VADState.Speaking:
                            if (rms < endTh)
                            {
                                vadState = VADState.Pause;
                                silenceTimer = 0;
                                GameApp.instance.tips.text="红岭牛听到你的提问了！";
                            }
                            break;

                        case VADState.Pause:
                            if (rms > startTh) vadState = VADState.Speaking;
                            else
                            {
                                silenceTimer += vadSampleWindow;
                                if (silenceTimer >= vadEndSilenceTime)
                                {
                                    vadState = VADState.Idle;
                                    HandleStopAndUpload(); // 处理上传
                                }
                            }
                            GameApp.instance.tips.text = "红岭牛思考中，马上为你解答……";
                            break;
                    }
                }
                yield return new WaitForSeconds(vadSampleWindow);
            }
        }

        private void HandleStopAndUpload()
        {
            // === 关键修改：立即暂停 VAD，防止自己录自己 ===
            SetIsRecogition(false);

            int currentPos = lastSamplePos;
            int length = (currentPos - recordingStartPos + micClip.samples) % micClip.samples;

            Debug.Log($"[VAD] 说话结束，截取长度: {length / 16000f:F2}s");

            float[] samples = new float[length];
            // 循环缓冲区读取逻辑
            if (recordingStartPos + length <= micClip.samples)
            {
                micClip.GetData(samples, recordingStartPos);
            }
            else
            {
                float[] part1 = new float[micClip.samples - recordingStartPos];
                micClip.GetData(part1, recordingStartPos);
                float[] part2 = new float[length - part1.Length];
                micClip.GetData(part2, 0);
                part1.CopyTo(samples, 0);
                part2.CopyTo(samples, part1.Length);
            }

            byte[] wavData = AudioToWavBytes(samples);
            _mono.StartCoroutine(UploadAudioRoutine(wavData));
        }

        IEnumerator UploadAudioRoutine(byte[] audioData)
        {
            string base64Audio = Convert.ToBase64String(audioData);

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
                request.SetRequestHeader("X-Api-App-Key", appId);
                request.SetRequestHeader("X-Api-Access-Key", accessToken);
                request.SetRequestHeader("X-Api-Resource-Id", resourceId);
                request.SetRequestHeader("X-Api-Request-Id", Guid.NewGuid().ToString());
                request.SetRequestHeader("X-Api-Sequence", "-1");

                yield return request.SendWebRequest();

                if (request.result == UnityWebRequest.Result.Success)
                {
                    ParseResult(request.downloadHandler.text);
                }
                else
                {
                    Debug.LogError($"[ASR] 上传失败: {request.error}");
                    // 失败了要恢复监听，否则程序卡死
                    SetIsRecogition(true);
                }
            }
        }

        private void ParseResult(string jsonResponse)
        {
            try
            {
                var response = JsonConvert.DeserializeObject<dynamic>(jsonResponse);
                string text2 = response.result.text;
                string text = response.result.text + "(请严格在150字之内完成回答,避免回答过长，回答应该采用几大段为形式，可以有回车符号，但是避免空行和多个不同分点出现。)";
                Debug.Log($"[ASR] 识别结果: {text}");
                SendCommand.Send(new AddChatContentCommand
                {
                    infoType = Enum.InfoType.My,
                    _addTextAction = value => value.Invoke(text2)
                });
                SendCommand.Send(new GenerateFinishCommand { });
                if (!string.IsNullOrEmpty(text))
                {
                    Debug.Log("TestTest");
                    voiceRecognitionResult.IsComplete = true;
                    voiceRecognitionResult.text = text;

                    SendCommand.Send(voiceRecognitionResult);
                    GameApp.instance.tips.text = "红岭牛思考中，马上为你解答……";
                    // 注意：这里不需要 SetIsRecogition(true)，因为 LLM 流程结束后会发命令来开启
                }
                else
                {
                    // 没识别到字，可能是杂音，重新开启监听
                    Debug.LogWarning("[ASR] 识别结果为空，重置监听");
                    SetIsRecogition(true);
                }
            }
            catch (Exception e)
            {
                Debug.LogError("[ASR] 解析异常: " + e.Message);
                SetIsRecogition(true); // 异常恢复
            }
        }

        private float CalculateRMS(float[] samples)
        {
            float sum = 0f;
            for (int i = 0; i < samples.Length; i++) sum += samples[i] * samples[i];
            return Mathf.Sqrt(sum / samples.Length);
        }

        private byte[] AudioToWavBytes(float[] samples)
        {
            // 保持你的 WAV 封装逻辑
            using (MemoryStream outStream = new MemoryStream())
            using (BinaryWriter writer = new BinaryWriter(outStream))
            {
                writer.Write(new char[4] { 'R', 'I', 'F', 'F' });
                writer.Write(36 + samples.Length * 2);
                writer.Write(new char[4] { 'W', 'A', 'V', 'E' });
                writer.Write(new char[4] { 'f', 'm', 't', ' ' });
                writer.Write(16); writer.Write((short)1); writer.Write((short)1); // 单通道
                writer.Write(16000); writer.Write(16000 * 2);
                writer.Write((short)2); writer.Write((short)16);
                writer.Write(new char[4] { 'd', 'a', 't', 'a' });
                writer.Write(samples.Length * 2);
                foreach (var sample in samples) writer.Write((short)(sample * short.MaxValue));
                return outStream.ToArray();
            }
        }
    }
}