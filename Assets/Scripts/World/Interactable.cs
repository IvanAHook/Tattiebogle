using UnityEngine;
using System.Collections;

public class Interactable  : MonoBehaviour {

    Animator animator;

    public Transform interractItem;
    public Sprite messageSprite;
    public Transform interactTransform;

    void Start() {
        if (animator) {
            animator = gameObject.GetComponentInChildren<Animator>();
        }
    }

    public void PlayAnim() {
        if (animator) {
            animator.SetTrigger("ClickTrigger");
        }
    }

    public virtual void Interact() {
//        if (messageSprite != null) {
//            GameObject.Find("MessageHandler").GetComponentInChildren<MessageHandler>().AddMessage(transform, new Vector3(0f, 2f, 1f), messageSprite, 4f);
//        }
    }

    public virtual void Interact(Transform item) {
        //if (t.GetComponent<UiItem>().worldItem == item;) {
        //    Destroy(t.gameObject);
        //}
    }

    public Vector3 GetInteractPosition() {
        return interactTransform.position;
    }
}
