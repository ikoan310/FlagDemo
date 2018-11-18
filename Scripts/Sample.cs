using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sample : MonoBehaviour {

    [SerializeField] SpriteRenderer num10;
    [SerializeField] SpriteRenderer num01;
    [SerializeField] Sprite[] sprites;


    private void Start()
    {
        InvokeRepeating( "ChangeNumber", 3f, 3f );
    }

    void ChangeNumber()
    {
        int index = Random.Range(0, 10);
        num10.sprite = sprites[index];
        index = Random.Range(0, 10);
        num01.sprite = sprites[index];
    }

}
