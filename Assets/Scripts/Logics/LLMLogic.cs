using LKZ.Chat.Commands;
using LKZ.Commands.Chat;
using LKZ.Commands.Voice;
using LKZ.DependencyInject;
using LKZ.GPT;
using LKZ.Models;
using LKZ.TypeEventSystem;
using LKZ.VoiceSynthesis;
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
        private bool isTTSSynthesizing = false; // 核心：合成锁
        private Action<string> _showUITextAction;
        
        private AudioClip streamingClip;
        private int totalSamplesWritten = 0; 
        private const int BufferSeconds = 120; // 增加长度
        private const int SampleRate = 24000;

        public void Initialized()
        {
            RegisterCommand.Register<VoiceRecognitionResultCommand>(VoiceRecognitionResultCommandCallback);
            RegisterCommand.Register<StopGenerateCommand>(StopGenerateCommandCallback);
        }

        private void VoiceRecognitionResultCommandCallback(VoiceRecognitionResultCommand obj)
        {
            if (!obj.IsComplete || string.IsNullOrEmpty(obj.text)) return;

            SendCommand.Send(new AddChatContentCommand {
                infoType = Enum.InfoType.ChatGPT,
                _addTextAction = value => _showUITextAction = value
            });

            ResetState();
            isLLMProcessing = true;
            
            _mono.StartCoroutine(LLM.Request(obj.text, ChatGPTStreamingCallback));
            _mono.StartCoroutine(StreamControlCor());
        }

        private void ChatGPTStreamingCallback(string chunk, bool isFinal)
        {
            if (!string.IsNullOrEmpty(chunk))
            {
                lock(textQueue) { textQueue.Enqueue(chunk); }
            }
            isLLMProcessing = !isFinal;
        }

        private IEnumerator StreamControlCor()
        {
            streamingClip = AudioClip.Create("StreamingTTS", SampleRate * BufferSeconds, 1, SampleRate, false);
            totalSamplesWritten = 0;
            bool hasStartedPlaying = false;

            // 循环条件：LLM没完 OR 队列里有字 OR 正在合成网络请求 OR 还没播完
            while (isLLMProcessing || textQueue.Count > 0 || isTTSSynthesizing || (hasStartedPlaying && IsAudioPlaying()))
            {
                string textToSynthesize = "";

                // 只有当上一个网络合成请求完全结束时，才发下一个
                if (!isTTSSynthesizing && textQueue.Count > 0)
                {
                    lock (textQueue)
                    {
                        while (textQueue.Count > 0) textToSynthesize += textQueue.Dequeue();
                    }
                }

                if (!string.IsNullOrEmpty(textToSynthesize))
                {
                    isTTSSynthesizing = true; 
                    Debug.Log($"[LLMLogic] 串行合成开始: {textToSynthesize}");
                    _showUITextAction?.Invoke(textToSynthesize);

                    VoiceTTS.StartStreamingSynthesis(textToSynthesize, 
                        onDataReceived: (samples) => {
                            // 将数据按顺序填入连续的 Buffer 空间
                            streamingClip.SetData(samples, totalSamplesWritten % (SampleRate * BufferSeconds));
                            totalSamplesWritten += samples.Length;
                        },
                        onComplete: () => {
                            isTTSSynthesizing = false; // 只有请求彻底完成后，才释放锁
                        }
                    );
                }

                // 缓冲 0.5 秒数据后再开始播，防止一开头就卡顿
                if (!hasStartedPlaying && totalSamplesWritten > SampleRate * 0.5f) 
                {
                    audioModel.Play(streamingClip);
                    SendCommand.Send(new ChatGPTStartTalkCommand());
                    hasStartedPlaying = true;
                }

                yield return new WaitForSeconds(0.05f);
            }

            Debug.Log("[LLMLogic] 播放完毕");
            PlayFinish();
        }

        private bool IsAudioPlaying()
        {
            if (streamingClip == null) return false;
            int currentSamplePos = (int)(audioModel.Time * SampleRate);
            // 只要播放进度还没追上写入进度，就认为还在播放有效内容
            return currentSamplePos < totalSamplesWritten - 500; 
        }

        private void ResetState()
        {
            isLLMProcessing = false;
            isTTSSynthesizing = false;
            lock(textQueue) { textQueue.Clear(); }
            if (streamingClip != null) { GameObject.Destroy(streamingClip); streamingClip = null; }
            totalSamplesWritten = 0;
        }

        private void StopGenerateCommandCallback(StopGenerateCommand obj) => PlayFinish();

        private void PlayFinish()
        {
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