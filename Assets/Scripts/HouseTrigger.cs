using UnityEngine;
using System.Collections;

public class HouseTrigger : MonoBehaviour {

    public Transform[] walls;

    bool showing = true;

    // fix this script lol
    void OnTriggerStay(Collider other) {
        if (other.transform.tag == "Player" && showing == true) {
            foreach (Transform wall in walls) {
                wall.GetComponent<MeshRenderer>().material.SetFloat("_Opacity", 0.25f);
            }
            showing = false;
        }
    }

    void OnTriggerEnter(Collider other) {
        if (other.transform.tag == "Player" && showing == true) {
            foreach (Transform wall in walls) {
                wall.GetComponent<MeshRenderer>().material.SetFloat("_Opacity", 0.25f);
            }
            showing = false;
        }
    }

    void OnTriggerExit(Collider other) {
        if (other.transform.tag == "Player" && showing == false) {
            foreach (Transform wall in walls) {
                wall.GetComponent<MeshRenderer>().material.SetFloat("_Opacity", 1f);
            }
            showing = true;
        }
    }

}
