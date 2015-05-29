using UnityEngine;
using System.Collections;

public class SpiderwebFirefly : Interactable {

    public Transform item;

    bool active;

    void Start() {
        active = false;
    }

    public void ItemInteract(Transform t) {
        if (t.GetComponent<UiItem>().worldItem == item && active) {
            Transform hand = FindObjectOfType<PlayerMovement>().hand;
            hand.GetComponent<UiHand>().Show();
            hand.GetComponent<UiHand>().PickupItem(transform);
            Destroy(t.gameObject);
        }
    }

    public void Activate() {
        active = true;
    }

}
