using LKZ.DependencyInject.Extension;
using UnityEngine;
using UnityEngine.Serialization;

namespace LKZ.DependencyInject
{
    /// <summary>
    /// 场景依赖注入上下文管理器
    /// 这是一个单例组件，用于管理场景中的依赖注入
    /// </summary>
    [DefaultExecutionOrder(-200)]  // 设置执行顺序，确保在其他脚本之前执行
    [HelpURL("http://www.lkz.fit")]  // 帮助文档链接
    [DisallowMultipleComponent]  // 防止在同一GameObject上添加多个此组件
    [AddComponentMenu("LKZ/依赖注入/场景依赖注入上下文管理器")]  // 在Unity组件菜单中的位置
    public class SceneDependencyInjectContextManager : MonoBehaviour
    {
        /// <summary>
        /// 单例实例
        /// </summary>
        public static SceneDependencyInjectContextManager Instance { get; private set; }

        [SerializeField, FormerlySerializedAs("是否跨场景不销毁")]
        private bool dontDestroyOnLoad = true;  // 是否在场景加载时不销毁此对象

        /// <summary>
        /// 依赖注入的ScriptableObject配置文件数组
        /// </summary>
        [SerializeField, FormerlySerializedAs("依赖注入ScriptableObject文件")]
        private DIScriptableObject[] scriptableObjects;  // 可序列化的依赖注入配置

        /// <summary>
        /// 依赖注入上下文，核心依赖注入容器
        /// </summary>
        private DependencyInjectContext dependencyInjectContext;

        /// <summary>
        /// 所有自定义组件
        /// </summary>
        private object[] AllCustomComponent;

        /// <summary>
        /// Awake方法，在Unity对象初始化时调用
        /// </summary>
        private void Awake()
        {
            // 如果设置为跨场景不销毁，则调用DontDestroyOnLoad
            if (dontDestroyOnLoad)
                DontDestroyOnLoad(this.gameObject);

            // 设置单例实例
            Instance = this;
            
            // 编辑器模式下检查是否重复存在多个管理器
#if UNITY_EDITOR
            if (FindObjectsOfType<SceneDependencyInjectContextManager>().Length > 1)
                Debug.LogError($"场景中存在多个{nameof(SceneDependencyInjectContextManager)}脚本!");
#endif

            // 初始化依赖注入上下文
            dependencyInjectContext = new DependencyInjectContext();
            
            // 获取所有自定义组件
            AllCustomComponent = dependencyInjectContext.GetCustomComponent();

            // 调用实现了IDIRegisterBinding接口的组件的绑定方法
            InvokeBindInjectsInterface(AllCustomComponent);
            
            // 从ScriptableObject文件加载依赖注入绑定配置
            InvokeInjectBindingScriptableObject();

            // 为使用了[Inject]属性的属性进行依赖注入
            InjectsProperty(AllCustomComponent);

            // 调用实现了IDIAwake接口的组件的Awake方法
            dependencyInjectContext.InvokeDIAwakeInterface(AllCustomComponent);
        }

        /// <summary>
        /// Start方法，在所有Awake方法调用后执行
        /// </summary>
        private void Start()
        {
            // 调用实现了IDIStart接口的组件的Start方法
            dependencyInjectContext.InvokeDIStartInterface(AllCustomComponent);
        }

        #region ScriptableObject依赖注入绑定
        /// <summary>
        /// 从ScriptableObject文件加载依赖注入绑定
        /// </summary>
        private void InvokeInjectBindingScriptableObject()
        {
            foreach (DIScriptableObject item in scriptableObjects)
            {
                item.InjectBinding(dependencyInjectContext);
            }
        }
        #endregion
         

        #region 依赖注入绑定接口调用
        /// <summary>
        /// 调用单个组件的依赖注入绑定接口
        /// 如果组件实现了IDIRegisterBinding接口，则调用其绑定方法
        /// </summary>
        /// <param name="component">自定义组件</param>
        public void InvokeBindInjectInterface(object component)
        {
            dependencyInjectContext.InvokeBindInjectInterface(component);
        }

        /// <summary>
        /// 调用多个组件的依赖注入绑定接口
        /// 如果组件实现了IDIRegisterBinding接口，则调用其绑定方法
        /// </summary>
        /// <param name="component">自定义组件数组</param>
        public void InvokeBindInjectsInterface(params object[] component)
        {
            // 调用实现了IDIRegisterBinding接口的组件的绑定方法
            dependencyInjectContext.InvokeBindInjectInterface(component);
        }
        #endregion

        #region 属性注入
        /// <summary>
        /// 为单个对象进行属性注入
        /// 查找所有标记了[Inject]特性的属性并进行依赖注入
        /// </summary>
        /// <param name="component">对象实例</param>
        public void InjectProperty(object component)
        {
            foreach (var property in component.GetType().GetUseInjectAttributeProperty())
            {
                dependencyInjectContext.InjectProperty(component, property);
            }
        }

        /// <summary>
        /// 为多个对象进行属性注入
        /// 查找所有标记了[Inject]特性的属性并进行依赖注入
        /// </summary>
        /// <param name="components">对象实例数组</param>
        public void InjectsProperty(object[] components)
        {
            foreach (object item in components)
            {
                foreach (var property in item.GetType().GetUseInjectAttributeProperty())
                {
                    dependencyInjectContext.InjectProperty(item, property);
                }
            }
            
        }
        #endregion

        #region 获取依赖注入接口
        /// <summary>
        /// 获取依赖注入的注册绑定接口
        /// </summary>
        /// <returns>IRegisterBinding接口实例</returns>
        public IRegisterBinding GetRegisterBindingInterface()
        {
            return dependencyInjectContext;
        }
        #endregion
    }
}