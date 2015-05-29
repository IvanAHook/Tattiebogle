using UnityEngine;
using System.Collections;

public class Pickup : MonoBehaviour {

	Animator animator;

	public Sprite sprite;

	void Start (){
        if (animator) {
		    animator = gameObject.GetComponentInChildren<Animator> ();
        }
	}

	void Update () {
	}

    public void ResetItem() {

    }

	public void PlayAnim(){
        if (animator) {
		    animator.SetTrigger ("ClickTrigger");
        }
	}
	


}
