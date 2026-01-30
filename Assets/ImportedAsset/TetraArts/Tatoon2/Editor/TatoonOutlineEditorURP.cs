using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace TA_TatoonEditor
{
    public class TatoonOutlineEditorURP : ShaderGUI
    {


        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {



            Outline(materialEditor, properties);

        }


        void Outline(MaterialEditor materialEditor, MaterialProperty[] properties)
        {

            MaterialProperty OutlineNoise = FindProperty("_OutlineNoise", properties);
            MaterialProperty OutlineColor = FindProperty("_OutlineColor", properties);
            MaterialProperty OutlineSize = FindProperty("_OutlineSize", properties);
            MaterialProperty OutlineNoiseScale = FindProperty("_OutlineNoiseScale", properties);
            MaterialProperty XSpeed = FindProperty("_XSpeed", properties);
            MaterialProperty YSpeed = FindProperty("_YSpeed", properties);

            GUILayout.Label("OUTLINE", EditorStyles.boldLabel);

            materialEditor.ShaderProperty(OutlineColor, OutlineColor.displayName);
            materialEditor.ShaderProperty(OutlineSize, OutlineSize.displayName);
            materialEditor.ShaderProperty(OutlineNoise, OutlineNoise.displayName);
            if (OutlineNoise.floatValue == 1)
            {
                materialEditor.ShaderProperty(OutlineNoiseScale, OutlineNoiseScale.displayName);
                materialEditor.ShaderProperty(XSpeed, XSpeed.displayName);
                materialEditor.ShaderProperty(YSpeed, YSpeed.displayName);
            }


            GUILayout.Label("_____________________________________________________________", EditorStyles.boldLabel);
        }

        public static class FxStyles
        {
            public static GUIStyle header;
            public static GUIStyle headerCheckbox;
            public static GUIStyle headerFoldout;
            public static GUIStyle headerTab;
            public static GUIStyle labelStyle;
            public static GUIStyle HeaderTexture;
            public static GUIContent textureLabel;
            public static GUIContent textureLabel2;
            public static GUIStyle colorPicker;
            public static GUIStyle topIMG;


            static FxStyles()
            {
                // Tab header
                header = new GUIStyle("ShurikenModuleTitle");
                header.font = (new GUIStyle("Label")).font;
                header.border = new RectOffset(15, 7, 4, 4);
                header.fixedHeight = 24;
                header.contentOffset = new Vector2(20f, -2f);
                header.alignment = TextAnchor.MiddleCenter;
                header.fontSize = 12;
                header.fontStyle = FontStyle.Bold;

                // Tab header checkbox
                headerCheckbox = new GUIStyle("ShurikenCheckMark");
                headerFoldout = new GUIStyle("Foldout");

                labelStyle = new GUIStyle(EditorStyles.label);
                //labelStyle.fontStyle = FontStyle.Bold;
                labelStyle.alignment = TextAnchor.MiddleLeft;
                labelStyle.fontSize = 11;
                labelStyle.normal.textColor = new Color32(0, 0, 0, 255);
                //labelStyle.stretchWidth = 10;

                HeaderTexture = new GUIStyle(EditorStyles.label);
                HeaderTexture.alignment = TextAnchor.MiddleCenter;



                textureLabel = new GUIContent();
                textureLabel2 = new GUIContent();

                colorPicker = new GUIStyle(EditorStyles.colorField);
                colorPicker.fixedWidth = 85;

                topIMG = new GUIStyle();
                topIMG.alignment = TextAnchor.MiddleCenter;
            }

            public static bool Header(string title, bool foldout, Color color)
            {
                var rect = GUILayoutUtility.GetRect(16f, 22f, FxStyles.header);
                var auxColor = GUI.color;
                GUI.color = color;
                UnityEngine.GUI.Box(rect, title, FxStyles.header);
                GUI.color = auxColor;

                var foldoutRect = new Rect(rect.x + 4f, rect.y + 2f, 13f, 13f);
                var e = Event.current;



                return foldout;
            }

            public static bool Header(string title, bool foldout, SerializedProperty enabledField, Color color)
            {
                var enabled = enabledField.boolValue;

                var rect = GUILayoutUtility.GetRect(16f, 22f, FxStyles.header);
                var auxColor = GUI.color;
                GUI.color = color;
                UnityEngine.GUI.Box(rect, title, FxStyles.header);
                GUI.color = auxColor;

                var toggleRect = new Rect(rect.x + 4f, rect.y + 4f, 13f, 13f);
                var e = Event.current;

                if (e.type == EventType.Repaint) FxStyles.headerCheckbox.Draw(toggleRect, false, false, enabled, false);

                if (e.type == EventType.MouseDown)
                {
                    const float kOffset = 2f;
                    toggleRect.x -= kOffset;
                    toggleRect.y -= kOffset;
                    toggleRect.width += kOffset * 2f;
                    toggleRect.height += kOffset * 2f;

                    if (toggleRect.Contains(e.mousePosition))
                    {
                        enabledField.boolValue = !enabledField.boolValue;
                        e.Use();
                    }
                    else if (rect.Contains(e.mousePosition))
                    {
                        foldout = !foldout;
                        e.Use();
                    }
                }

                return foldout;
            }

            public static bool Header(string title, bool foldout, MaterialProperty enabledField, Color color)
            {
                var enabled = (enabledField.floatValue == 1);

                var rect = GUILayoutUtility.GetRect(16f, 22f, FxStyles.header);
                var auxColor = GUI.color;
                GUI.color = color;
                UnityEngine.GUI.Box(rect, title, FxStyles.header);
                GUI.color = auxColor;

                var toggleRect = new Rect(rect.x + 4f, rect.y + 4f, 13f, 13f);
                var e = Event.current;

                if (e.type == EventType.Repaint) FxStyles.headerCheckbox.Draw(toggleRect, false, false, enabled, false);

                if (e.type == EventType.MouseDown)
                {
                    const float kOffset = 2f;
                    toggleRect.x -= kOffset;
                    toggleRect.y -= kOffset;
                    toggleRect.width += kOffset * 2f;
                    toggleRect.height += kOffset * 2f;

                    if (toggleRect.Contains(e.mousePosition))
                    {
                        enabledField.floatValue = (enabledField.floatValue == 0) ? 1 : 0;
                        e.Use();
                    }

                }

                return foldout;
            }
        }
    }
}
