//
//  ViewController.swift
//  TutorApp
//
//  Created by Tazeen on 26/03/17.
//  Copyright © 2017 Tazeen. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    @IBAction func login(_ sender: UIButton)
    {
        if emailText.text != "" && passwordText.text != ""
        {
            if segmentControl.selectedSegmentIndex == 0
            {
                FIRAuth.auth()?.signIn(withEmail: emailText.text!, password: passwordText.text!, completion: {(user,error) in
                    if user != nil
                    {
                        print ("suh")
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        
                        }
                        else
                        {
                            print("error")
                        }
                    }
                })
            }
            else
            {
                FIRAuth.auth()?.createUser(withEmail: emailText.text!, password: passwordText.text!, completion: { (user,error) in
                    if user != nil
                        
                    {
                        
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("error")
                        }
                    }
                })
            }
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

