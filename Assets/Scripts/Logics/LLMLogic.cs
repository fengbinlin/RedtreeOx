using LKZ.Chat.Commands;
using LKZ.Commands.Chat;
using LKZ.Commands.Voice;
using LKZ.DependencyInject;
using LKZ.GPT;
using LKZ.Models;
using LKZ.TypeEventSystem;
using LKZ.VoiceSynthesis;
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
        private const int SampleRate = 24000;

        // 新增：追踪实际可播放的采样数和上次写入完成时的播放位置
        private int lastChunkEndSample = 0;
        private bool isWaitingForNextChunk = false;

        private LLMConfig config;

        // 新增：会话ID，用于取消过期的TTS回调
        private int currentSessionId = 0;
        public void Initialized()
        {
            config = Resources.Load<LLMConfig>("LLMConfig");
            RegisterCommand.Register<VoiceRecognitionResultCommand>(VoiceRecognitionResultCommandCallback);
            RegisterCommand.Register<StopGenerateCommand>(StopGenerateCommandCallback);
        }

        private void VoiceRecognitionResultCommandCallback(VoiceRecognitionResultCommand obj)
        {
            if (!obj.IsComplete || string.IsNullOrEmpty(obj.text)) return;

            SendCommand.Send(new AddChatContentCommand
            {
                infoType = Enum.InfoType.ChatGPT,
                _addTextAction = value => _showUITextAction = value
            });

            ResetState();

            string[] quickResponses =
            {
                "让我稍加思考一下，给你一个满意的答案。",
                "红岭牛马上为你解答，请稍等片刻。",
                "这是一个有趣而且很好的问题，让我认真考虑一下。",
                "让我想一想，这个问题值得仔细推敲。",
                "好的，我来看看能不能给出最准确的回应。",
                "让我快速整理一下思路，马上告诉你答案。",
                "这个问题真不错，让我来深入分析一下。",
                "稍等一下，我来为你找到最佳的解决方案。",
                "让我打开知识库，查找最贴合的答案。",
                "这很值得探讨，让我先分析一下背景信息。"
            };
            string chosenText = quickResponses[UnityEngine.Random.Range(0, quickResponses.Length)];

            lock (textQueue)
            {
                textQueue.Enqueue(chosenText);
            }

            isLLMProcessing = true;
            // 递增会话ID，使旧的TTS回调失效
            currentSessionId++;
            _mono.StartCoroutine(LLM.Request(obj.text, ChatGPTStreamingCallback));
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
            // 捕获当前会话ID
            int sessionId = currentSessionId;
            Debug.Log("AAA");
            streamingClip = AudioClip.Create("StreamingTTS", SampleRate * BufferSeconds, 1, SampleRate, false);
            totalSamplesWritten = 0;
            lastChunkEndSample = 0;
            isWaitingForNextChunk = false;
            bool hasStartedPlaying = false;

            while (isLLMProcessing || textQueue.Count > 0 || isTTSSynthesizing || (hasStartedPlaying && IsAudioPlaying()))
            {
                Debug.Log($"BBB isLLMProcessing={isLLMProcessing} queueCount={textQueue.Count} isTTSSynthesizing={isTTSSynthesizing} hasStartedPlaying={hasStartedPlaying} IsAudioPlaying={IsAudioPlaying()} isWaiting={isWaitingForNextChunk}");
                // 检查会话是否已过期
                if (sessionId != currentSessionId)
                {
                    Debug.Log("[LLMLogic] 会话已过期，退出协程");
                    yield break;
                }
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
                    // 捕获当前会话ID用于回调
                    int capturedSessionId = sessionId;
                    Debug.Log("CCC");
                    isTTSSynthesizing = true;

                    // 关键修复：如果之前在等待，需要暂停播放器直到有新数据
                    if (isWaitingForNextChunk && hasStartedPlaying)
                    {
                        audioModel.Pause();
                        Debug.Log("[LLMLogic] 暂停播放，等待新chunk合成");
                    }

                    Debug.Log($"[LLMLogic] 开始合成: {textToSynthesize}");
                    _showUITextAction?.Invoke(textToSynthesize);

                    int chunkStartSample = totalSamplesWritten;
                    bool firstDataReceived = false;

                    VoiceTTS.StartStreamingSynthesis(textToSynthesize,
                        onDataReceived: (samples) =>
                        {
                            // 检查会话是否仍然有效
                            if (capturedSessionId != currentSessionId)
                            {
                                Debug.Log("[LLMLogic] TTS回调已过期，忽略数据");
                                return;
                            }
                            Debug.Log("DDD");
                            if (samples != null && samples.Length > 0)
                            {
                                streamingClip.SetData(samples, totalSamplesWritten % (SampleRate * BufferSeconds));
                                totalSamplesWritten += samples.Length;

                                // 关键修复：收到第一批数据后，如果之前暂停了，恢复播放
                                if (!firstDataReceived && isWaitingForNextChunk && hasStartedPlaying)
                                {
                                    firstDataReceived = true;
                                    isWaitingForNextChunk = false;

                                    // 将播放位置设置到新chunk开始的位置
                                    float newTime = (float)chunkStartSample / SampleRate;
                                    audioModel.SetTime(newTime);
                                    audioModel.Resume();
                                    Debug.Log($"[LLMLogic] 恢复播放，从位置 {newTime}s 开始");
                                }
                            }
                        },
                        onComplete: () =>
                        {
                            // 检查会话是否仍然有效
                            if (capturedSessionId != currentSessionId)
                            {
                                Debug.Log("[LLMLogic] TTS回调已过期，忽略数据");
                                return;
                            }
                            Debug.Log("EEE");
                            lastChunkEndSample = totalSamplesWritten;
                            isTTSSynthesizing = false;
                        }
                    );
                }

                // 检测是否播放到了当前已写入数据的末尾，但还有更多内容要合成
                if (hasStartedPlaying && !isTTSSynthesizing && !isWaitingForNextChunk)
                {
                    int currentSamplePos = (int)(audioModel.Time * SampleRate);
                    // 如果播放位置接近已写入数据末尾，且还有更多LLM内容或队列中有内容
                    if (currentSamplePos >= totalSamplesWritten - SampleRate * 0.1f && (isLLMProcessing || textQueue.Count > 0))
                    {
                        isWaitingForNextChunk = true;
                        Debug.Log("[LLMLogic] 播放即将到达末尾，标记等待下一个chunk");
                    }
                }

                if (!hasStartedPlaying && totalSamplesWritten > SampleRate * 0.5f)
                {
                    audioModel.Play(streamingClip);
                    SendCommand.Send(new ChatGPTStartTalkCommand());
                    hasStartedPlaying = true;
                }

                yield return new WaitForSeconds(0.05f);
            }

            // 完成前再次检查
            if (sessionId == currentSessionId)
            {
                PlayFinish();
            }
        }

        private bool IsAudioPlaying()
        {
            if (streamingClip == null) return false;

            // 如果正在等待下一个chunk，认为还在"播放中"
            if (isWaitingForNextChunk) return true;

            int currentSamplePos = (int)(audioModel.Time * SampleRate);
            return currentSamplePos < totalSamplesWritten - 500;
        }

        private void ResetState()
        {
            isLLMProcessing = false;
            isTTSSynthesizing = false;
            isWaitingForNextChunk = false;
            lastChunkEndSample = 0;
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