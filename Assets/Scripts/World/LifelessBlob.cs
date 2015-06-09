using UnityEngine;
using System.Collections;
using DG.Tweening;

public class LifelessBlob : Interactable {

    public Transform player;

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

}
