using UnityEngine;
using System.Collections;

public class GroupVegetationHit : MonoBehaviour {

	void OnTriggerEnter() {
		foreach (Transform child in transform) {
			child.SendMessage("TriggerWobble", SendMessageOptions.DontRequireReceiver);
		}
	}

}
