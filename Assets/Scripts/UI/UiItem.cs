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

    bool dragging = true;

    PlayerMovement playerMovement;
    PlayerGroupController playerGroupController;

    void Start() {

        cam = Camera.main;
        GetComponent<Image>().sprite = sprite;
        playerMovement = GameObject.Find("Player").GetComponent<PlayerMovement>();
        playerGroupController = GameObject.Find("Player_Group").GetComponent<PlayerGroupController>();

    }

    void Update() {

        // dont do this in update, and make better logic for this
        if (target && playerMovement.agent.remainingDistance < 0.25f && Vector3.Distance(playerMovement.transform.position, target.GetComponent<Interactable>().interactTransform.position) < 1f) {
            target.GetComponent<Interactable>().Interact(transform);
            target = null;
            playerMovement.Halt();
        }

    }

    public void OnBeginDrag(PointerEventData eventData) {
        UiHand.mouseExit += ShowWorldItem;
        UiHand.mouseEnter += ShowIcon;
        dragging = true;

        originalParent = transform.parent;
        transform.SetParent(transform.parent.parent);

        RaycastHit hitInfo;

        // Dont continue if raycast does not hit anything!
        if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
            //GetComponent<Image>().sprite = sprite;
            return;
        }

        transform.GetComponent<RectTransform>().localScale = new Vector3(0.5f, 0.5f, 0.5f);

    }

    // fix worlditem going behind ui
    public void OnDrag(PointerEventData eventData) {

        transform.position = eventData.position;
        RaycastHit hitInfo;

        // Plane raycast?
        // Dont continue if raycast does not hit anything!
        if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
            //GetComponent<Image>().sprite = sprite;
            return;
        }

        worldItem.position = GetMousePositionOnXY();

    }

    public void OnEndDrag(PointerEventData eventData) {
        UiHand.mouseExit -= ShowWorldItem;
        UiHand.mouseEnter -= ShowIcon;
        dragging = false;

        RaycastHit hitInfo;

        ShowIcon();

        transform.GetComponent<RectTransform>().localScale = new Vector3(1f, 1f, 1f);
        transform.SetParent(originalParent);

        // Dont continue if raycast does not hit anything!
        if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
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

    void ShowWorldItem() {
        if (worldItem.gameObject.activeSelf == false) {
            worldItem.gameObject.SetActive(true);
            transform.GetComponent<Image>().enabled = false;
        }
    }

    void ShowIcon() {
        if (worldItem.gameObject.activeSelf == true) {
            worldItem.gameObject.SetActive(false);
            transform.GetComponent<Image>().enabled = true;
        }
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

    //void OnEnable() {
    //        UiHand.mouseExit += ShowWorldItem;
    //        UiHand.mouseEnter += ShowIcon;
    //}

    //void OnDisable() {
    //        UiHand.mouseExit -= ShowWorldItem;
    //        UiHand.mouseEnter -= ShowIcon;
    //}

}
