//
//  ViewController.swift
//  ParseChat
//
//  Created by Rohan Trivedi on 2/22/17.
//  Copyright © 2017 Rohan Trivedi. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginButtonPressed()
    {
        var logins = PFQuery(className: "User")
        var objects = try! logins.findObjects()
        for i in objects
        {
            var Cusername = i.object(forKey: "username")! as! String
            var Cpassword = i.object(forKey: "password")! as! String
            if Cusername == emailTextField.text! && Cpassword == passwordTextField.text!
            {
                print("complete")
            }
        }
    }
    
    @IBAction func signupButtonPressed()
    {
        var logins = PFQuery(className: "User")
        var objects = try! logins.findObjects()
        for i in objects
        {
            var Cusername = i.object(forKey: "username")! as! String
            if Cusername == emailTextField.text!
            {
                return
            }
        }
        var query = PFObject(className: "User")
        query.setValue(emailTextField.text!, forKey: "username")
        query.setValue(passwordTextField.text!, forKey: "password")
        try! query.save()
        loginButtonPressed()
    }
    
}

