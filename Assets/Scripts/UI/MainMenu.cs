using UnityEngine;
using System.Collections;

public class MainMenu : MonoBehaviour {

	public GameObject mainMenu;
	

	public void StartGame(){
        Application.LoadLevel("MainLevelImplementingStuff");
	}
	
	public void QuitGame(){
		Application.Quit();
	}
}
