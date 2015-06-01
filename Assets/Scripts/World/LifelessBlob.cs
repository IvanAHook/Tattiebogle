using UnityEngine;
using System.Collections;

public class LifelessBlob : Interactable {

    public override void Interact(Transform item) {
        if (item.GetComponent<UiItem>().worldItem == interractItem) {
            Destroy(item.gameObject);
            transform.gameObject.layer = 14;
            transform.gameObject.tag = "Player";
            GetComponent<BoxCollider>().enabled = false;
            //GetComponentInChildren<BlobAIPlayerBlobFall>().enabled = false;
            GetComponentInChildren<PlayerBlobMovement>().enabled = true;
            //GetComponentInChildren<BlobAI>().enabled = true;
        }
    }

}
