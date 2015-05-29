using UnityEngine;
using System.Collections;

public class LifelessBlob : Actor {

    void ItemInteract(Transform t) {
        if (t.GetComponent<UiItem>().worldItem == item) {
            Destroy(t.gameObject);
            transform.gameObject.layer = 14;
            transform.gameObject.tag = "Player";
            GetComponent<BoxCollider>().enabled = false;
            //GetComponentInChildren<BlobAIPlayerBlobFall>().enabled = false;
            GetComponentInChildren<PlayerBlobMovement>().enabled = true;
            //GetComponentInChildren<BlobAI>().enabled = true;
        }
    }

}
