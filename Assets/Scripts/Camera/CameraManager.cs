// 引入必要的命名空间
using LKZ.Commands.Camera;    // 相机命令系统
using LKZ.DependencyInject;   // 依赖注入框架
using LKZ.Rolle;              // 角色相关
using LKZ.TypeEventSystem;    // 事件系统
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace LKZ.Camera
{
    // 密封的相机管理器类，继承自MonoBehaviour
    public sealed class CameraManager : MonoBehaviour
    {
        // 可序列化的位置结构体，用于在Inspector中配置相机位置
        [Serializable]
        public sealed class PosStruct
        {
            public Vector3 Pos;       // 相机位置
            public Vector3 Rotation;  // 相机旋转（欧拉角）
            
            [HideInInspector]         // 在Inspector中隐藏，不显示
            internal Quaternion quaternion;  // 转换后的四元数
        }

        [SerializeField]
        private PosStruct[] PosStructs;  // 相机位置配置数组

        [SerializeField]
        private float moveSpeed = 1f;  // 相机移动速度

        private Transform camera_tf;  // 相机Transform组件引用

        // 依赖注入：命令注册器
        [Inject]
        private IRegisterCommand RegisterCommand { get; set; }

        // 依赖注入：角色位置接口
        [Inject]
        private IRollePosition RollePosition { get; set; }

        private int posIndex = 0;  // 当前相机位置索引
        private Coroutine moveCoroutine;  // 相机移动协程引用
        private Vector3 cameraPosOffset;  // 相机与角色之间的偏移量
        private bool isFollow;  // 是否跟随角色标志

        // Start方法：初始化
        private void Start()
        {
            // 注册切换相机命令的回调函数
            RegisterCommand.Register<SwitchCameraCommand>(SwitchCameraCommandCallback);
            
            // 获取相机Transform（假设相机是子对象）
            camera_tf = transform.GetChild(0);

            // 将欧拉角转换为四元数
            for (int i = 0; i < PosStructs.Length; i++)
            {
                PosStructs[i].quaternion = Quaternion.Euler(PosStructs[i].Rotation);
            }

            // 设置初始相机位置和旋转
            camera_tf.localPosition = PosStructs[0].Pos;
            camera_tf.localRotation = PosStructs[0].quaternion;

            // 计算相机与角色之间的初始偏移量
            cameraPosOffset = camera_tf.position - RollePosition.RolleShowPosition;
            isFollow = true;  // 启用角色跟随
        }

        // LateUpdate：在每帧的Update之后执行，常用于相机跟随
        private void LateUpdate()
        {
            if (isFollow)
            {
                // 平滑跟随角色位置
                var currentPos = camera_tf.position;
                camera_tf.position = Vector3.Slerp(currentPos, RollePosition.Position + cameraPosOffset, Time.deltaTime * 2);
            }
        }

        // 切换相机命令的回调函数
        private void SwitchCameraCommandCallback(SwitchCameraCommand obj)
        {
            // 如果已有相机移动协程在运行，停止它
            if (!object.ReferenceEquals(null, moveCoroutine))
                StopCoroutine(moveCoroutine);

            // 循环切换到下一个相机位置
            posIndex = ++posIndex % PosStructs.Length;
            
            // 启动新的相机移动协程
            moveCoroutine = StartCoroutine(MoveCameraCoroutine(PosStructs[posIndex].Pos, PosStructs[posIndex].quaternion));
        }

        // 相机移动协程：平滑移动到目标位置
        private IEnumerator MoveCameraCoroutine(Vector3 targetPos, Quaternion quat)
        {
            isFollow = false;  // 移动过程中暂时停止角色跟随

            float t = 0;  // 插值系数
            var currentPos = camera_tf.localPosition;  // 当前位置
            var currentQu = camera_tf.localRotation;   // 当前旋转

            // 插值动画循环
            while (t < 1f)
            {
                t += Time.deltaTime * this.moveSpeed;  // 根据速度增加插值系数
                t = Mathf.Clamp01(t);  // 限制在0-1之间

                // 使用Slerp平滑插值更新位置和旋转
                camera_tf.localPosition = currentPos = Vector3.Slerp(currentPos, targetPos, t);
                camera_tf.localRotation = currentQu = Quaternion.Slerp(currentQu, quat, t);
                yield return null;  // 等待下一帧
            }
            
            moveCoroutine = null;  // 清空协程引用

            // 重新计算相机与角色的偏移量
            cameraPosOffset = camera_tf.position - RollePosition.RolleShowPosition;
            isFollow = true;  // 重新启用角色跟随
        }
    }
}