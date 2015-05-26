﻿using UnityEngine;
using System.Collections;
using DG.Tweening;

public class LockedDoor : Interactable {

    public Transform item;

	Animation anim;
	public BoxCollider col;
    
	public bool activate;
	//Vector3 destination;

    public Transform blocker;

	void Start () {
		anim = GetComponentInChildren<Animation> ();
		//destination = new Vector3 (transform.position.x, transform.position.y, transform.position.z + 2f);
	}
	

	void Update () {
		if (activate) {
			OpenDoor();
		}
	}


	void ItemInteract(Transform t){
		if (t.GetComponent<UiItem>().worldItem == item) {
			activate = true;
            Destroy(t.gameObject);
		}
	}

	public void OpenDoor(){
		anim ["Take 001"].wrapMode = WrapMode.ClampForever;
		anim.Play ("Take 001");
        blocker.transform.gameObject.SetActive(false);
		col.enabled = false;
		//transform.DOMove (destination, 0.2f).SetEase (Ease.InOutCubic);
	}

}
