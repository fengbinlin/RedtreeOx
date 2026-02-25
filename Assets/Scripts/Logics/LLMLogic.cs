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

namespace LKZ.Logics
{
    public sealed class LLMLogic
    {
        [Inject] private AudioModel audioModel { get; set; }
        [Inject] private MonoBehaviour _mono { get; set; }
        [Inject] private ISendCommand SendCommand { get; set; }
        [Inject] private IRegisterCommand RegisterCommand { get; set; }

        private Queue<string> textQueue = new Queue<string>();
        private bool isLLMProcessing = false;
        private bool isTTSSynthesizing = false;
        private Action<string> _showUITextAction;

        private AudioClip streamingClip;
        private int totalSamplesWritten = 0;
        private const int BufferSeconds = 120;
        private const int SampleRate = 24000; // 必须与 VoiceTTS 中的 SourceSampleRate 一致

        private LLMConfig config;

        public void Initialized()
        {
            // 加载配置资产
            config = Resources.Load<LLMConfig>("LLMConfig");
            RegisterCommand.Register<VoiceRecognitionResultCommand>(VoiceRecognitionResultCommandCallback);
            RegisterCommand.Register<StopGenerateCommand>(StopGenerateCommandCallback);
        }

        private void VoiceRecognitionResultCommandCallback(VoiceRecognitionResultCommand obj)
        {
            // 严格匹配 VoiceRecognitionResultCommand 的 text 字段
            if (!obj.IsComplete || string.IsNullOrEmpty(obj.text)) return;

            SendCommand.Send(new AddChatContentCommand
            {
                infoType = Enum.InfoType.ChatGPT,
                _addTextAction = value => _showUITextAction = value
            });

            ResetState();
            isLLMProcessing = true;

            // 启动 LLM 协程 (基于 Dify/Python Demo 逻辑)
            _mono.StartCoroutine(LLM.Request(obj.text, ChatGPTStreamingCallback));
            // 启动音频流控制协程
            _mono.StartCoroutine(StreamControlCor());
        }

        private void ChatGPTStreamingCallback(string chunk, bool isFinal)
        {
            if (!string.IsNullOrEmpty(chunk))
            {
                lock (textQueue) { textQueue.Enqueue(chunk); }
            }
            isLLMProcessing = !isFinal;
        }

        private IEnumerator StreamControlCor()
        {
            Debug.Log("AAA");
            streamingClip = AudioClip.Create("StreamingTTS", SampleRate * BufferSeconds, 1, SampleRate, false);
            totalSamplesWritten = 0;
            bool hasStartedPlaying = false;

            while (isLLMProcessing || textQueue.Count > 0 || isTTSSynthesizing || (hasStartedPlaying && IsAudioPlaying()))
            {
                Debug.Log("BBB"+isLLMProcessing+" "+textQueue.Count+" "+isTTSSynthesizing+" "+hasStartedPlaying+" "+IsAudioPlaying());
                string textToSynthesize = "";

                if (!isTTSSynthesizing && textQueue.Count > 0)
                {
                    lock (textQueue)
                    {
                        while (textQueue.Count > 0) textToSynthesize += textQueue.Dequeue();
                    }
                }

                if (!string.IsNullOrEmpty(textToSynthesize))
                {
                    Debug.Log("CCC");
                    isTTSSynthesizing = true;
                    Debug.Log($"[LLMLogic] 开始合成: {textToSynthesize}");
                    _showUITextAction?.Invoke(textToSynthesize);

                    // 核心修复：调用 VoiceTTS 静态类的流式合成方法
                    VoiceTTS.StartStreamingSynthesis(textToSynthesize,
                        onDataReceived: (samples) =>
                        {
                            Debug.Log("DDD");
                            if (samples != null && samples.Length > 0)
                            {
                                // 将音频采样数据填入 AudioClip 缓冲区
                                streamingClip.SetData(samples, totalSamplesWritten % (SampleRate * BufferSeconds));
                                totalSamplesWritten += samples.Length;
                            }
                        },
                        onComplete: () =>
                        {
                            Debug.Log("EEE");
                            isTTSSynthesizing = false;

                        }
                    );
                }

                if (!hasStartedPlaying && totalSamplesWritten > SampleRate * 0.5f)
                {
                    audioModel.Play(streamingClip);
                    SendCommand.Send(new ChatGPTStartTalkCommand());
                    hasStartedPlaying = true;
                }
                
                yield return new WaitForSeconds(0.05f);
            }

            PlayFinish();
        }

        private bool IsAudioPlaying()
        {
            if (streamingClip == null) return false;
            int currentSamplePos = (int)(audioModel.Time * SampleRate);
            return currentSamplePos < totalSamplesWritten - 500;
        }

        private void ResetState()
        {
            isLLMProcessing = false;
            isTTSSynthesizing = false;
            lock (textQueue) { textQueue.Clear(); }
            if (streamingClip != null) { GameObject.Destroy(streamingClip); streamingClip = null; }
            totalSamplesWritten = 0;
        }

        private void StopGenerateCommandCallback(StopGenerateCommand obj) => PlayFinish();

        private void PlayFinish()
        {
            Debug.Log("语音播放停止");
            DigitalHumanAnimatorController.instance.StopTalking();
            audioModel.Stop();
            ResetState();
            _mono.StopAllCoroutines();

            SendCommand.Send(new SettingVoiceRecognitionCommand { IsStartVoiceRecognition = true });
            SendCommand.Send(new GenerateFinishCommand { });
            _showUITextAction = null;
        }
    }
}