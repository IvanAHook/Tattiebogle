using UnityEngine;
using System.Collections;

public class Interactable : MonoBehaviour {

    Animator animator;

    public Transform interactTransform;

    public Sprite sprite;

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

    public Vector3 GetInteractPosition() {
        return interactTransform.position;
    }
}
