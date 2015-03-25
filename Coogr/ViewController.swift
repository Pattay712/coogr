//
//  ViewController.swift
//  Coogr
//
//  Created by Patrick Kelly on 3/24/15.
//  Copyright (c) 2015 Apetto, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var push = PFPush()
        push.setMessage("This is a test.")
        push.sendPushInBackgroundWithBlock({
            (isSuccessful: Bool, error: NSError!) -> Void in
            println(isSuccessful)
        })
        
        var permissions = ["public_profile"]
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                } else {
                    println("User logged in through Facebook!")
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

