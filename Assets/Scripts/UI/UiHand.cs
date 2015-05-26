using UnityEngine;
using System.Collections;
using DG.Tweening;

public class UiHand : MonoBehaviour {

    public Transform player;
    public Transform heldItem;

    float hideDelay = 5f;
    float hideTimer = 0f;

    public GameObject defaultItemPrefab;

    void Update() {
        hideTimer += Time.deltaTime;
        if (hideTimer >= hideDelay) {
            transform.DOMoveY(-76f, 0.5f);
            //transform.position = new Vector3(0f, -76f, 0f);
        }
    }

    public void PickupItem(Transform item) {
        if (item.GetComponent<Pickup>()) {
            heldItem = ((GameObject)Instantiate(defaultItemPrefab, Vector3.zero, Quaternion.identity)).transform;
            heldItem.GetComponent<UiItem>().sprite = item.GetComponent<Pickup>().sprite;
            heldItem.GetComponent<UiItem>().worldItem = item;
            heldItem.GetComponent<UiItem>().worldItem.gameObject.layer = 11;
            foreach (Transform i in heldItem.GetComponent<UiItem>().worldItem.GetComponentsInChildren<Transform>()) {
                i.gameObject.layer = 11; 
        	} 
            heldItem.SetParent(transform);

            item.gameObject.SetActive(false);
        }
    }

    public void DropHeldItem() {
        if (heldItem && heldItem.GetComponent<UiItem>()) {
            heldItem.GetComponent<UiItem>().Drop(player.transform.position);
            Destroy(heldItem.gameObject);
        }
    }

    public void Show() {
        hideTimer = 0f;
        transform.DOMoveY(0f, 0.5f);
    }

}
