using UnityEngine;
using UnityEngine.UI;

namespace LKZ.UI
{
    public sealed class ShowContent : MonoBehaviour
    {
        [SerializeField, Tooltip("文本最大宽度")]
        private float textMaxWidth = 755f;

        [SerializeField, Tooltip("父物体的格外大小")]
        private Vector2 _parentExtraSize = new Vector2(5f, 5f);

        [SerializeField, Tooltip("复制按钮高度")]
        private float coptButtonHeight;

        public Text _text;

        private RectTransform _textParent;

        private LayoutElement _textLayout;

        public bool Enabled
        {
            get
            {
                return this.enabled;
            }
            set
            {
                this.enabled = true;
                GetComponentInChildren<ContentSizeFitter>().enabled = true;
                GetComponentInChildren<LayoutElement>().enabled = true;
            }
        }


        public float Height
        {
            get
            {
                return _textParent.rect.height + coptButtonHeight;
            }
        }



        public void Initialized(Vector2 position)
        {
            var _rect = GetComponent<RectTransform>();

            _textLayout = _text.GetComponent<LayoutElement>();
            _textParent = _text.rectTransform.parent.GetComponent<RectTransform>();

            _rect.localScale = Vector3.one;
            _rect.anchoredPosition = position;
        }


        public void AddText(in string str)
        {
            _text.text += str;
        }


        private void LateUpdate()
        {
            var rect = _text.rectTransform.rect;

            // 获取文本的缩放比例
            Vector3 textScale = _text.rectTransform.localScale;

            // 计算反缩放后的真实逻辑尺寸
            float logicWidth = rect.width * textScale.x;
            float logicHeight = rect.height * textScale.y;

            // 将textMaxWidth转换为逻辑宽度进行比较
            float logicMaxWidth = textMaxWidth * textScale.x;

            // 用逻辑宽度与逻辑宽度限制比较
            if (logicWidth >= logicMaxWidth && _textLayout.preferredWidth != textMaxWidth)
            {
                _textLayout.preferredWidth = textMaxWidth;  // 这里仍然用原始值，因为LayoutElement使用渲染宽度
                return;
            }

            // 使用逻辑尺寸计算父物体大小
            Vector2 logicSize = new Vector2(logicWidth, logicHeight);
            _textParent.sizeDelta = logicSize + _parentExtraSize;
        }
    }
}
