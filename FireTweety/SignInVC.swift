//
//  SignInVC.swift
//  FireTweety
//
//  Created by Ivan Cernja on 30/04/2017.
//  Copyright © 2017 Ivan Cernja. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()


    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        performSegue(withIdentifier: "ContactsSegue", sender: nil)
    }

    @IBAction func signUp(_ sender: Any) {
    }
 
    
}

// class
