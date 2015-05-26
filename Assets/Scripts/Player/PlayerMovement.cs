using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;

public class PlayerMovement : MonoBehaviour {

    CharacterController cc;
    public NavMeshAgent agent;

    public bool isMoving;
    public bool active = true;

    public float speed = 100f;
    bool pickup;
    bool interract;

    Transform interractActor;

    public Transform inventoryItem;

    public Transform hand;

    Camera cam;
    Vector3 targetPosition;
    Vector3 moveDirection = Vector3.zero;

    void Start() {

        cc = GetComponent<CharacterController>();

        cam = Camera.main;
        targetPosition = transform.position;

        agent = GetComponent<NavMeshAgent>();

    }

    void Update() {

        Shader.SetGlobalVector("_PlayerPos", transform.position);
        //Debug.Log(agent.velocity.magnitude);
        if (agent.velocity.magnitude > 1.5f) {
            if (!isMoving) {
                isMoving = true;
                transform.GetComponent<AudioSource>().Play();
            }
        } else {
            if (isMoving) {
                isMoving = false;
                transform.GetComponent<AudioSource>().Stop();
            }
        }

        if (active) {
            UpdateInput();
        }


        if (interract && interractActor) {
            if (Vector3.Distance(transform.position, agent.destination) < 2f) {
                interractActor.GetComponent<Actor>().Interact();
                interract = false;
            }
        }

        if (pickup && inventoryItem) {
            if (Vector3.Distance(transform.position, inventoryItem.position) < 2f) {
                PickupItem();
            }
        }

    }

    void UpdateInput() {

                /*moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
                moveDirection = transform.TransformDirection(moveDirection);
                moveDirection *= speed;

                cc.Move(moveDirection * Time.fixedDeltaTime);
                Quaternion wanted_rotation = Quaternion.LookRotation(moveDirection);
                transform.rotation = Quaternion.RotateTowards(transform.rotation, wanted_rotation, 1000f * Time.fixedDeltaTime);*/

        if (Input.GetMouseButtonDown(0)) {

            RaycastHit hitInfo;

            // Dont continue if raycast does not hit anything!
            if (!Physics.Raycast(cam.ScreenPointToRay(Input.mousePosition), out hitInfo)) {
                return;
            }

            // Dont continue if clicking on ui
            if (EventSystem.current.IsPointerOverGameObject()) {
                return;
            }

            if (hitInfo.transform.gameObject.layer == 8 || hitInfo.transform.gameObject.layer == 10 || hitInfo.transform.gameObject.layer == 12) {

                TargetHit(hitInfo.transform);

            }

        }

    }

    public void SetDestination(Vector3 destination) {
        NavMeshPath path = new NavMeshPath();
        agent.CalculatePath(destination, path);
        if (path.status == NavMeshPathStatus.PathComplete) {
            agent.SetPath(path);
        } else {
            Halt();
        }
    }

    public void Halt() {
        agent.ResetPath();
    }

    void TargetHit(Transform t) {
        if (t.tag == "Actor") {
            interract = true;
            interractActor = t;
            agent.destination = t.GetComponent<Actor>().interactTransform.position;
            return;
        }
        if (t.tag == "Pickup") {
            pickup = true;
            t.GetComponent<Pickup>().PlayAnim();
            inventoryItem = t;
            return;
        }
        if (t.tag == "Interactable") {
            return;
        }
        pickup = false;
        interract = false;
    }
    
    void PickupItem() {

        hand.GetComponent<UiHand>().PickupItem(inventoryItem);
        pickup = false;

    }

}
