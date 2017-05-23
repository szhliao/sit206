//
//  touchID.swift
//  DoALittle
//
//  Created by xin on 22/5/17.
//  Copyright © 2017 Scott. All rights reserved.
//
import UIKit
//kit for touchID
import LocalAuthentication
class touchID: UIViewController

{
    //define touchID pop up trigger
    @IBAction func touchBtn(_ sender: Any)
    {
        
        //Commented code out for testing, TOUCH ID
        //setting context of phone features as context
 //       let context: LAContext = LAContext()
        //check users device for touchID compatability
  //      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
//        {
//            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Authenticate to Access To-Do-List", reply: { (wasSuccess, wasFail) in
                
//                if wasSuccess
//                {
//                  performSegue(withIdentifier: "segue", sender: self)
//                }
//
//                else
//                {
//                  performSegue(withIdentifier: "segue", sender: self)
//                }
//            })
//        }
  performSegue(withIdentifier: "segue", sender: self)
    }
}

