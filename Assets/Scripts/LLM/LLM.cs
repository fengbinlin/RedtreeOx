using System;
using System.Text;
using UnityEngine.Networking;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using LKZ.Logics;
using Newtonsoft.Json.Linq;

namespace LKZ.GPT
{
    public sealed class Certificate : CertificateHandler
    {
        protected override bool ValidateCertificate(byte[] certificateData)
        {
            return true;
        }
    }
    public static class LLM
    {
        private readonly static WaitForSeconds wait_internal = new WaitForSeconds(0.2f);

        private readonly static char[] Segmentations = new char[] { '；', ';', '。', ':', '：', '！', '!', '?', '？', ',', '，' };

        [Serializable]
        public class UserDataStruct
        {
            public string model;
            public List<Message> messages;


            /// <summary>
            /// 是否流式
            /// </summary>
            public bool stream;

            /// <summary>
            /// 采样温度，控制输出的随机性，必须为正数
            /// 取值范围是：(0.0,1.0]，不能等于 0，默认值为 0.95,值越大，会使输出更随机，更具创造性；值越小，输出会更加稳定或确定
            /// 建议您根据应用场景调整 top_p 或 temperature 参数，但不要同时调整两个参数
            /// </summary>
            public float temperature;

            /// <summary>
            /// 用温度取样的另一种方法，称为核取样
            /// 取值范围是：(0.0, 1.0) 开区间，不能等于 0 或 1，默认值为 0.7
            /// 模型考虑具有 top_p 概率质量tokens的结果
            /// 例如：0.1 意味着模型解码器只考虑从前 10% 的概率的候选集中取tokens
            /// 建议您根据应用场景调整 top_p 或 temperature 参数，但不要同时调整两个参数
            /// </summary>
            public float top_p;

            public float top_k;
            public float max_prompt_tokens;
            public float max_new_tokens;
        }

        [Serializable]
        public class Message
        {
            private Message() { }

            public string role;
            public string content;

            public static Message CreateSystemMessage(string content)
            {
                return new Message() { role = "system", content = content };
            }

            public static Message CreateUserMessage(string content)
            {
                return new Message() { role = "user", content = content };
            }

            public static Message CreateAssistantMessage(string content)
            {
                return new Message() { role = "assistant", content = content };
            }
        }

        readonly static UserDataStruct userDataStruct;
        static readonly LLMConfig config;
        static LLM()
        {
            config = UnityEngine.Resources.Load<LLMConfig>("LLMConfig");

            userDataStruct = new UserDataStruct()
            {
                model = config.model,
                stream = true,
                messages = new List<Message>(),
                temperature = 1,
                top_p = 0.7f,
            };
            userDataStruct.messages.Add(Message.CreateSystemMessage(config.roleSetting));
        }

        /// <summary>
        /// llm
        /// </summary>
        /// <param name="content"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public static IEnumerator Request(string content, Action<string, bool> callback)
        {
            userDataStruct.messages.Add(Message.CreateUserMessage(content));


            return RequestGPTSegmentation(JsonUtility.ToJson(userDataStruct), callback);
        }


        private static IEnumerator RequestGPTSegmentation(string requestData, Action<string, bool> callback)
        {
            string last = "";
            string mess = "";

            Debug.Log("===== [LLM] 准备发送 GPT 请求 =====");
            Debug.Log($"URL: {config.url}");
            Debug.Log($"Model: {userDataStruct.model}");
            Debug.Log($"API Key (前8位显示): {config.key.Substring(0, Math.Min(8, config.key.Length))}********");
            Debug.Log($"请求体 JSON:\n{requestData}");

            using (var request = new UnityWebRequest(config.url, "POST"))
            {
                request.uploadHandler = new UploadHandlerRaw(Encoding.UTF8.GetBytes(requestData))
                { contentType = "application/json" };

                request.downloadHandler = new DownloadHandlerBuffer();
                request.certificateHandler = new Certificate();

                // 设置 Header
                request.SetRequestHeader("Authorization", $"Bearer {config.key}");
                Debug.Log($"Header: Authorization = Bearer {config.key.Substring(0, Math.Min(8, config.key.Length))}********");

                UnityWebRequestAsyncOperation asyncOp = request.SendWebRequest();

                while (!asyncOp.isDone)
                {
                    Debug.Log("[LLM] 等待响应...");
                    Disponse(false);
                    yield return wait_internal;
                }

                Debug.Log($"[LLM] 请求完成，HTTP状态码: {request.responseCode}");

                if (request.result == UnityWebRequest.Result.ConnectionError || request.result == UnityWebRequest.Result.ProtocolError)
                {
                    Debug.LogError("[LLM] 请求失败");
                    Debug.LogError($"Error: {request.error}");
                    Debug.LogError($"响应原文: {request.downloadHandler.text}");
                    callback?.Invoke("GPT出现点问题", true);
                    yield break;
                }

                // 处理最后一次数据
                Disponse(true);

                // 内部解析方法（原封不动）
                void Disponse(bool isComplete)
                {
                    string temp = "";
                    var str = request.downloadHandler.text;
                    Debug.Log($"[LLM] 当前收到数据长度: {str.Length}");
                    Debug.Log($"[LLM] 原始响应:\n{str}");

                    if (!string.IsNullOrEmpty(last))
                    {
                        temp = str.Replace(last, "");
                    }
                    else
                        temp = str;

                    last = str;

                    var datas = temp.Split("data:");
                    foreach (var requestJson in datas)
                    {
                        if (string.IsNullOrEmpty(requestJson))
                            continue;

                        if (requestJson.Contains("[DONE]"))
                            break;

                        try
                        {
                            var jsonP = JToken.Parse(requestJson.Replace("data:", ""));
                            var item = jsonP["choices"][0];
                            var tt = item["delta"].SelectToken("content")?.ToString();
                            if (!string.IsNullOrEmpty(tt))
                            {
                                tt = tt.Trim();
                                mess += tt;
                                Debug.Log($"[LLM] 增量文本: {tt}");
                            }
                            var finish = item.SelectToken("finish_reason");
                            if (finish != null && finish.ToString() == "stop")
                            {
                                Debug.Log("[LLM] 收到 finish_reason=stop");
                                break;
                            }
                        }
                        catch (Exception ex)
                        {
                            Debug.LogError($"[LLM] JSON解析错误: {ex.Message}");
                        }
                    }

                    string text2 = "";
                    if (!isComplete)
                    {
                        int index = 0;
                        foreach (var item in Segmentations)
                        {
                            if (mess.Contains(item))
                            {
                                index = mess.IndexOf(item);
                                break;
                            }
                        }
                        if (index != 0)
                        {
                            ++index;
                            text2 = mess.Substring(0, index);
                            mess = mess.Remove(0, index);
                        }
                    }
                    else
                    {
                        text2 = mess;
                    }
                    callback.Invoke(text2, isComplete);
                }
            }
        }
    }
}
