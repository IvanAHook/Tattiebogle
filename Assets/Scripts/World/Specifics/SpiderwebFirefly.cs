using UnityEngine;
using System.Collections;

public class SpiderwebFirefly : Interactable {

    public Transform item;

    public void ItemInteract(Transform t) {
        if (t.GetComponent<UiItem>().worldItem == item) {
            Destroy(t.gameObject);
        }
    }

    public void Activate() {

    }

}
