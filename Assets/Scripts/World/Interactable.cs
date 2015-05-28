using UnityEngine;
using System.Collections;

public class Interactable : MonoBehaviour {

    Animator animator;

    public Transform interactTransform;

    void Start() {
        if (animator) {
            animator = gameObject.GetComponentInChildren<Animator>();
        }
    }

    void Update() {
    }

    public void PlayAnim() {
        if (animator) {
            animator.SetTrigger("ClickTrigger");
        }
    }

    public void Interact() {
    }

    void ItemInteract() {
    }

    public Vector3 GetInteractPosition() {
        return interactTransform.position;
    }
}
