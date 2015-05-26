using UnityEngine;
using System.Collections;

public class CameraScript : MonoBehaviour {

    static Plane XZPlane = new Plane(Vector3.up, Vector3.zero);

    Vector3 originalPosition;
    Vector3 bounds;
    Vector3 cameraOffset;

    float zoomPercent;

    public float smooth;

    public Transform target;

    bool stay = false;

	void Start () {

        cameraOffset = transform.position - target.position;
        //originalPosition = transform.position; 
	
	}
	
	void Update () {

        //if (!stay) {
        //transform.position = new Vector3(target.position.x + cameraOffset.x, transform.position.y, target.position.z + cameraOffset.z);
        transform.position = Vector3.Lerp(transform.position, new Vector3(target.position.x + cameraOffset.x, transform.position.y, target.position.z + cameraOffset.z), Time.deltaTime * smooth);
        //}

	}

    /*public void SetPosition(Vector3 pos) {
        transform.position = new Vector3(transform.position.x, transform.position.y, pos.z);
    }

    public void SetBounds(Vector3 bounds) {
        this.bounds = bounds;
    }

    public void SetStay(bool stay) {
        this.stay = stay;
    }

    Vector3 GetMousePositionOnXY() {
        float distance;
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (XZPlane.Raycast(ray, out distance)) {
            Vector3 hitPoint = ray.GetPoint(distance);
            //         hitPoint.y = 1f;
            return hitPoint;
        }
        return Vector3.zero;
    }*/

}
