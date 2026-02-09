using UnityEngine;

namespace LKZ.Logics
{
    [CreateAssetMenu(fileName = nameof(LLMConfig), menuName = "大模型配置表")]
    public sealed class LLMConfig : ScriptableObject
    {
        public string url = "https://api.dify.ai/v1/chat-messages";
        public string key;
        public string user = "default_user";
        public string conversation_id = ""; // 记录对话ID
    }
}