using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UiItem : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler {

    static Plane XZPlane = new Plane(Vector3.up, new Vector3(0f, 1f, 0f));

    public Transform worldItem;
    Transform tempWorldItem;
    public Sprite sprite;

    Transform originalParent;
    Camera cam;

    public Transform spawnItemParent;

    Transform target;

    PlayerMovement playerMovement;

    void Start() {

        cam = Camera.main;
        GetComponent<Image>().sprite = sprite;
        playerMovement = GameObject.Find("Player").GetComponent<PlayerMovement>();

    }

    void Update() {

        if (target && playerMovement.agent.remainingDistance < 0.25f) {
            //target.transform.SendMessage("Interact", transform, SendMessageOptions.DontRequireReceiver);
            //Debug.Log(target.GetComponent<Interactable>());
            target.GetComponent<Interactable>().Interact(transform);
            target = null;
            playerMovement.Halt();
        }
    }

    public void OnBeginDrag(PointerEventData eventData) {

        originalParent = transform.parent;
        transform.SetParent(transform.parent.parent);
        transform.GetComponent<Image>().enabled = false;

        

        RaycastHit hitInfo;

        // Dont continue if raycast does not hit anything!
        if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
            GetComponent<Image>().sprite = sprite;
            return;
        }

        transform.GetComponent<RectTransform>().localScale = new Vector3(0.5f, 0.5f, 0.5f);

    }

    // fix worlditem going behind ui
    public void OnDrag(PointerEventData eventData) {

        // Dont continue if clicking on ui
        if (!EventSystem.current.IsPointerOverGameObject()) {
            if (!worldItem.gameObject.activeSelf) {
                worldItem.gameObject.SetActive(true);
            }
            //return;
        }

        transform.position = eventData.position;

        RaycastHit hitInfo;

        // Plane raycast?
        // Dont continue if raycast does not hit anything!
        if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
            GetComponent<Image>().sprite = sprite;
            return;
        }

        worldItem.position = GetMousePositionOnXY();

        if (hitInfo.transform.tag == "Intractable") {
            worldItem.LookAt(hitInfo.transform);
        }

//        worldItem.position = new Vector3(hitInfo.transform.position.x, 1f, hitInfo.transform.position.z);

    }

    public void OnEndDrag(PointerEventData eventData) {

        RaycastHit hitInfo;


        transform.GetComponent<Image>().enabled = true;

        transform.GetComponent<RectTransform>().localScale = new Vector3(1f, 1f, 1f);
        transform.SetParent(originalParent);

        worldItem.gameObject.SetActive(false);

        // Dont continue if raycast does not hit anything!
        if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
            GetComponent<Image>().sprite = sprite;
            return;
        }
        
        if (hitInfo.transform.tag == "Interactable") {
            target = hitInfo.transform;
            playerMovement.SetDestination(target.GetComponent<Interactable>().GetInteractPosition());
        }

    }

    Vector3 GetMousePositionOnXY() {
        float distance;
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (XZPlane.Raycast(ray, out distance)) {
            Vector3 hitPoint = ray.GetPoint(distance);
            hitPoint.y = 1f;
            return hitPoint;
        }
        return Vector3.zero;
    } 

    public void Drop(Vector3 pos) {

        if (worldItem) {
            worldItem.gameObject.layer = 10;
            worldItem.transform.position = pos;
            worldItem.transform.rotation = Quaternion.identity;
            worldItem.GetComponent<Pickup>().ResetItem();
            worldItem.gameObject.SetActive(true);
        }

    }

}
