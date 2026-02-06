using UnityEngine;

public class DigitalHumanAnimatorController : MonoBehaviour
{
    private Animator animator;
    private bool isTalking = false;

    private float currentClipLength = 0f;
    private float timer = 0f;

    public Transform mouthBone;
    public float mouthOpenMin = 0f;
    public float mouthOpenMax = 25f;
    public float mouthMoveSpeed = 10f;
    private float currentMouthAngle = 0f;
    private float targetMouthAngle = 0f;
    private Quaternion defaultMouthRotation;

    public bool isFirstTalk = true;

    // 👇新增：记录最近两次随机结果
    private int lastTalkIndex = -1;
    private int secondLastTalkIndex = -1;

    void Awake()
    {
        animator = GetComponent<Animator>();
        if (mouthBone != null)
            defaultMouthRotation = mouthBone.localRotation;
    }

    void Start()
    {
        animator.SetTrigger("StartWave");
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Q))
        {
            if (!isTalking)
                StartTalking();
            else
                StopTalking();
        }

        if (isTalking)
        {
            timer += Time.deltaTime;
            if (timer >= currentClipLength)
            {
                PlayNextTalkAnimation();
            }
        }

        UpdateMouthMovement();
    }

    void StartTalking()
    {
        isTalking = true;
        PlayNextTalkAnimation();
        animator.SetBool("IsTalking", true);
    }

    void StopTalking()
    {
        isFirstTalk = true;
        isTalking = false;
        animator.SetBool("IsTalking", false);
        timer = 0f;
        currentClipLength = 0f;
    }

    /// <summary>
    /// 随机选择下一段讲话动画并播放
    /// </summary>
    void PlayNextTalkAnimation()
    {
        if (!isTalking) return;

        int talkIndex;

        if (isFirstTalk)
        {
            talkIndex = 1;
            isFirstTalk = false;
        }
        else
        {
            // 随机一个 0~1 的浮点数，用来判断是否允许重复
            float repeatChance = Random.value; // [0,1)

            if (repeatChance < 0.2f)
            {
                // 🟡 20% 概率允许和上一次相同
                talkIndex = lastTalkIndex;
            }
            else
            {
                // 🟢 80% 概率强制不同
                // 如果只有 2 个可选值，可以直接用 1 - lastTalkIndex，效率高
                int newIndex = Random.Range(0, 2);
                if (newIndex == lastTalkIndex)
                {
                    // 强制切换
                    newIndex = 1 - lastTalkIndex;
                }
                talkIndex = newIndex;
            }
        }

        // 更新记录
        secondLastTalkIndex = lastTalkIndex;
        lastTalkIndex = talkIndex;

        animator.SetInteger("TalkIndex", talkIndex);

        AnimatorClipInfo[] clipInfo = animator.GetCurrentAnimatorClipInfo(0);
        if (clipInfo.Length > 0)
            currentClipLength = clipInfo[0].clip.length*2.0f/3;
        else
            currentClipLength = 3f;

        timer = 0f;
        Debug.Log($"播放新讲话动作：Talk_{talkIndex} (Length={currentClipLength:F2}s)");
    }

    void UpdateMouthMovement()
    {
        if (mouthBone == null) return;

        if (isTalking)
        {
            if (Mathf.Abs(Mathf.DeltaAngle(currentMouthAngle, targetMouthAngle)) < 1f)
                targetMouthAngle = Random.Range(mouthOpenMin, mouthOpenMax);

            currentMouthAngle = Mathf.Lerp(currentMouthAngle, targetMouthAngle, Time.deltaTime * mouthMoveSpeed);
            mouthBone.localRotation = defaultMouthRotation * Quaternion.Euler(currentMouthAngle, 0f, 0f);
        }
        else
        {
            currentMouthAngle = Mathf.Lerp(currentMouthAngle, 0f, Time.deltaTime * mouthMoveSpeed);
            mouthBone.localRotation = defaultMouthRotation * Quaternion.Euler(currentMouthAngle, 0f, 0f);
        }
    }
}