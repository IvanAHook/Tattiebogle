using UnityEngine;
using System.Collections;
using DG.Tweening;

public class LifelessBlob : Interactable {

    public Transform player;

    void Update() {
        //ProximityBrightness();
    }

    public override void Interact(Transform item) {
        if (item.GetComponent<UiItem>().worldItem == interractItem) {
            Destroy(item.gameObject);
            transform.GetComponentInChildren<SkinnedMeshRenderer>().material.DOFloat(1f, "_Emission", 1f);
            transform.gameObject.layer = 14;
            transform.gameObject.tag = "Player";
            GetComponent<BoxCollider>().enabled = false;
			GetComponentInChildren<BlobAIPlayerBlobFall>().RunAgain();
            GetComponentInChildren<PlayerBlobMovement>().enabled = true;

            //GetComponentInChildren<PlayerBlobMovement>().SetDestination(player.position);
            //GetComponentInChildren<BlobAI>().enabled = true;
        }
    }

    void ProximityBrightness() {
        if (Vector3.Distance(transform.position, interractItem.position) < 4f) {
            transform.GetComponentInChildren<SkinnedMeshRenderer>().material.DOFloat(0.35f, "_Emission", 1f);
        } else if (Vector3.Distance(transform.position, interractItem.position) > 4f) {
            transform.GetComponentInChildren<SkinnedMeshRenderer>().material.DOFloat(0.25f, "_Emission", 1f);
        }
    }

}
