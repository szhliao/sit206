//
//  SecondViewController.swift
//  DoALittle
//
//  Created by xin on 22/5/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //initialize variables for vc 2
    
    @IBOutlet var additemTxt: UITextField!
    
    @IBAction func additemBtn(_ sender: AnyObject)
    {
        //check if there is input in field, only add if filled in
        if (additemTxt.text) != ""
        {
            //add this item to array
            list.append(additemTxt.text!)
            //refresh text field
            additemTxt.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

