using System;
using System.Text;
using UnityEngine.Networking;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using LKZ.Logics;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace LKZ.GPT
{
    public sealed class Certificate : CertificateHandler
    {
        protected override bool ValidateCertificate(byte[] certificateData) => true;
    }

    public static class LLM
    {
        private readonly static WaitForSeconds wait_internal = new WaitForSeconds(0.1f);
        private readonly static char[] Segmentations = new char[] { '；', ';', '。', ':', '：', '！', '!', '?', '？', ',', '，' };

        /// <summary>
        /// 严格匹配 Python Demo 的 Request 方法
        /// </summary>
        public static IEnumerator Request(string content, Action<string, bool> callback)
        {
            // 重新加载配置以获取最新的 URL 和 Key
            LLMConfig config = Resources.Load<LLMConfig>("LLMConfig");

            // 构造严格对标 Python Demo 的 Payload
            var payload = new
            {
                inputs = new Dictionary<string, object>(),
                query = content,
                response_mode = "streaming", // 强制使用流式以适配 LLMLogic 的队列机制
                user = config.user,
                conversation_id = config.conversation_id
            };

            string jsonPayload = JsonConvert.SerializeObject(payload);

            using (UnityWebRequest request = new UnityWebRequest(config.url, "POST"))
            {
                byte[] bodyRaw = Encoding.UTF8.GetBytes(jsonPayload);
                request.uploadHandler = new UploadHandlerRaw(bodyRaw);
                request.downloadHandler = new DownloadHandlerBuffer();
                request.certificateHandler = new Certificate();

                request.SetRequestHeader("Content-Type", "application/json");
                request.SetRequestHeader("Authorization", $"Bearer {config.key}");

                UnityWebRequestAsyncOperation asyncOp = request.SendWebRequest();

                string mess = "";
                int lastProcessedIndex = 0;

                while (!asyncOp.isDone || request.downloadHandler.text.Length > lastProcessedIndex)
                {
                    Debug.Log("GGG " + !asyncOp.isDone + " " + request.downloadHandler.text.Length + " " + lastProcessedIndex);
                    if (request.result == UnityWebRequest.Result.ConnectionError || request.result == UnityWebRequest.Result.ProtocolError)
                    {
                        Debug.LogError($"[LLM] 请求失败: {request.error} | {request.downloadHandler.text}");
                        callback?.Invoke("对话出现错误", true);
                        yield break;
                    }

                    string fullText = request.downloadHandler.text;
                    if (fullText.Length > lastProcessedIndex)
                    {
                        string newChunk = fullText.Substring(lastProcessedIndex);
                        lastProcessedIndex = fullText.Length;

                        // 解析 Dify SSE 数据流
                        string[] lines = newChunk.Split(new[] { "data:" }, StringSplitOptions.RemoveEmptyEntries);
                        foreach (var line in lines)
                        {
                            string data = line.Trim();
                            if (string.IsNullOrEmpty(data) || data.Contains("[DONE]")) continue;

                            try
                            {
                                JObject json = JObject.Parse(data);
                                string eventType = json["event"]?.ToString();

                                if (eventType == "message")
                                {
                                    string answer = json["answer"]?.ToString();
                                    if (!string.IsNullOrEmpty(answer))
                                    {
                                        // 🔹直接打印文本片段
                                        Debug.Log($"[LLM StreamingText] {answer}");

                                        mess += answer;

                                        if (json.ContainsKey("conversation_id"))
                                            config.conversation_id = json["conversation_id"].ToString();

                                        // 实时断句回调给 LLMLogic
                                        ProcessAndCallback(ref mess, false, callback);
                                    }
                                }
                                else if (eventType == "message_end")
                                {
                                    Debug.Log("IIII");
                                    // 无论 mess 是否为空，都标记结束
                                    if (!string.IsNullOrEmpty(mess))
                                    {
                                        ProcessAndCallback(ref mess, true, callback);
                                    }
                                    else
                                    {
                                        callback?.Invoke("", true); // 直接标记 isFinal=true
                                    }
                                    yield break;
                                }
                            }
                            catch { /* 忽略不完整的JSON片断 */ }
                        }
                    }
                    yield return wait_internal;
                }
                // // 🔴 兜底逻辑：循环结束，但没有触发 message_end
                // Debug.Log("HHHH");
                // ProcessAndCallback(ref mess, true, callback);
            }
        }

        private static void ProcessAndCallback(ref string mess, bool isFinal, Action<string, bool> callback)
        {
            if (string.IsNullOrEmpty(mess)) return;

            if (!isFinal)
            {
                int index = mess.IndexOfAny(Segmentations);
                if (index != -1)
                {
                    string sentence = mess.Substring(0, index + 1);
                    mess = mess.Remove(0, index + 1);
                    callback?.Invoke(sentence, false);
                }
            }
            else
            {
                callback?.Invoke(mess, true);
                mess = "";
            }
        }
    }
}