using UnityEngine;
using System.Collections;

public class Pickup : MonoBehaviour {

	Animator animator;

    public Transform worldItem;
	public Sprite sprite;

	void Start (){
        if (animator) {
		    animator = gameObject.GetComponentInChildren<Animator> ();
        }
	}

    public void ResetItem() {

    }

	public void PlayAnim(){
        if (animator) {
		    animator.SetTrigger ("ClickTrigger");
        }
	}
	


}
