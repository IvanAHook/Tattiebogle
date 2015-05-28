using UnityEngine;
using System.Collections;

public class MainMenu : MonoBehaviour {

	public GameObject mainMenu;
	

	public void StartGame(){
		Application.LoadLevel ("TestScene3");
	}
	
	public void QuitGame(){
		Application.Quit();
	}
}
