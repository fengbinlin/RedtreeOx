using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;

namespace LKZ.DependencyInject
{
    /// <summary>
    /// 自动依赖注入绑定器
    /// 用于在场景加载时自动注册依赖注入绑定
    /// 当场景加载完成后，静态初始化器会自动将组件注册到依赖注入容器
    /// </summary>
    [DisallowMultipleComponent]  // 禁止在同一个GameObject上添加多个此组件
    [AddComponentMenu("LKZ/依赖注入/自动依赖注入绑定", order: 11)]  // 在Unity的Component菜单中添加此项
    public class AutoInjectDIBind : MonoBehaviour, IDRegisterBindingInterface
    {
        /// <summary>
        /// 需要绑定的项目列表
        /// 在Inspector面板中配置需要自动绑定的MonoBehaviour组件及其绑定类型
        /// </summary>
        [SerializeField, FormerlySerializedAs("需要绑定的列表")]
        private AutoBindingItemStruct[] autoBindingItemStructs;

        /// <summary>
        /// 是否在销毁时取消注册
        /// 如果为true，当GameObject销毁时会自动从依赖注入容器中移除绑定
        /// </summary>
        [SerializeField, FormerlySerializedAs("是否在销毁时取消注册")]
        private bool isDestroyUnRegister = true;

        /// <summary>
        /// 依赖注入注册器接口引用
        /// 用于执行实际的绑定和取消绑定操作
        /// </summary>
        private IRegisterBinding registerBinding;

        /// <summary>
        /// 实现IDRegisterBindingInterface接口的方法
        /// 在适当的时机被调用，用于执行依赖注入绑定注册
        /// </summary>
        /// <param name="registerBinding">依赖注入注册器实例</param>
        void IDRegisterBindingInterface.DIRegisterBinding(IRegisterBinding registerBinding)
        {
            // 保存注册器引用，用于后续的取消注册操作
            this.registerBinding = registerBinding;
            
            // 遍历所有配置的绑定项
            foreach (AutoBindingItemStruct item in autoBindingItemStructs)
            {
                // 根据绑定类型执行不同的绑定操作
                switch (item.bindingType)
                {
                    case BindingType.BindingToSelf:
                        // 将组件绑定到自身的类型
                        registerBinding.BindingToSelf(item.monoBehaviour);
                        break;
                    case BindingType.BindingToSelfAndAllInterface:
                        // 将组件绑定到自身的类型以及实现的所有接口
                        registerBinding.BindingToSelfAndAllInterface(item.monoBehaviour);
                        break;
                    case BindingType.BindingToAllInterface:
                        // 将组件绑定到实现的所有接口
                        registerBinding.BindingToAllInterface(item.monoBehaviour);
                        break;
                }
            }
        }

        /// <summary>
        /// 当GameObject被销毁时调用
        /// 如果启用了销毁时取消注册，会移除所有之前注册的绑定
        /// </summary>
        private void OnDestroy()
        {
            if (isDestroyUnRegister && registerBinding != null)
            {
                // 遍历所有绑定项，执行对应的取消注册操作
                foreach (AutoBindingItemStruct item in autoBindingItemStructs)
                {
                    switch (item.bindingType)
                    {
                        case BindingType.BindingToSelf:
                            // 取消自身类型的绑定
                            registerBinding.UnRegister(item.monoBehaviour.GetType());
                            break;
                        case BindingType.BindingToSelfAndAllInterface:
                            // 取消自身类型及所有接口的绑定
                            registerBinding.UnBindingToSelfAndAllInterface(item.monoBehaviour.GetType());
                            break;
                        case BindingType.BindingToAllInterface:
                            // 取消所有接口的绑定
                            registerBinding.UnBindingToAllInterface(item.monoBehaviour.GetType());
                            break;
                    }
                }
            }
        }
    }
}