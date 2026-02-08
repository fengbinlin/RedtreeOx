using LKZ.DependencyInject;
using LKZ.Rolle;
using LKZ.TypeEventSystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace LKZ.Models
{
    /// <summary>
    /// 音频模块
    /// </summary> 
    public sealed class AudioModel : MonoBehaviour, IDRegisterBindingInterface
    {
        //private RolleManager rolleManager;
         

        //public bool IsPlaying => rolleManager.AudioSource.isPlaying;
        public float Time => audioSource.time;
        public AudioSource audioSource;
         

        private void Awake()
        {
            //rolleManager = FindObjectOfType<RolleManager>(); 
        }

        void IDRegisterBindingInterface.DIRegisterBinding(IRegisterBinding registerBinding)
        {
            registerBinding.Binding<AudioModel>().To(this);
        }

        public void Play(AudioClip clip)
        {
            audioSource.clip = clip;
            audioSource.Play();
            DigitalHumanAnimatorController.instance.StartTalking();
        }

        public void Stop() => audioSource.Stop();
    }
}
