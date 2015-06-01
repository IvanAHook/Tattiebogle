using UnityEngine;

public class VegetationHit : MonoBehaviour 
{
	//Editor settings
	public float MaxWobble = 1;
	public float SlowDown = 1;
	public float SpeedUp = 1;
	
	//local vars
	private Material mat;
	private float startWobble;
	private float currentWobble;
	private bool doWobble;
	private bool slowDown;
	private int wobbleID;

	void Awake()
	{
		mat = GetComponent<Renderer> ().material;
		wobbleID = Shader.PropertyToID ("_Intensity");
		startWobble = mat.GetFloat (wobbleID);
	}

	void Update () 
	{
		if (doWobble) 
		{
			mat.SetFloat (wobbleID,currentWobble);  //updating the materials wobble value
			if (!slowDown)
			{
				currentWobble+=Time.deltaTime*SpeedUp;
				if (currentWobble>=MaxWobble)
				{
					slowDown=true;
				}
			}
			else
			{
				currentWobble-=Time.deltaTime*SlowDown;
			}


			//stop controlling wobble when it has reached the original value
			if (currentWobble<=startWobble)
			{
				currentWobble=startWobble;
				doWobble=false;
				slowDown=false;
			}
		}
	}

	void OnTriggerEnter()
	{
		//start wobbling
		doWobble = true;
		slowDown = false;
		//currentWobble = MaxWobble;
	}
}
