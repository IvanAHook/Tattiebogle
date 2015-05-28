﻿using UnityEngine;
using System.Collections;
using DG.Tweening;
using UnityEngine.EventSystems;

public class PlayerBlobMovement : MonoBehaviour {

    CharacterController cc;
    NavMeshAgent agent;

    AudioSource audioSource;

    public AudioClip[] footsteps;
    public float footDelay;

    public bool active = false;

    public bool isMoving;

    public float speed = 100f;

    public Transform player;

    Vector3 targetPosition;
    Vector3 moveDirection = Vector3.zero;

    void Start() {

        cc = GetComponent<CharacterController>();

        targetPosition = transform.position;

        agent = GetComponent<NavMeshAgent>();

        audioSource = transform.GetComponent<AudioSource>();
        StartCoroutine(Footsteps());
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


    void Update() {

        if (!active && player.GetComponent<PlayerMovement>().isMoving) {
            SetDestination(player.position - player.forward);
        }

        //Debug.Log(agent.velocity.magnitude);
        if (agent.velocity.magnitude > 1.5f) {
            if (!isMoving) {
                isMoving = true;
            }
        } else {
            if (isMoving) {
                isMoving = false;
            }
        }

    }

    IEnumerator Footsteps() {
        while (true) {
            if (isMoving) {
                audioSource.PlayOneShot(footsteps[Random.Range(0, footsteps.Length)]);
                yield return new WaitForSeconds(footDelay);
            } else {
                yield return 0;
            }
        }
    }

}
