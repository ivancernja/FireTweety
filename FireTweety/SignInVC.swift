//
//  SignInVC.swift
//  FireTweety
//
//  Created by Ivan Cernja on 30/04/2017.
//  Copyright © 2017 Ivan Cernja. All rights reserved.
//

import UIKit
import FirebaseAuth

typealias LoginHandler = (_ msg:String?) -> Void;

struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid E-mail address, please provide a real E-mail address";
    static let WRONG_PASSWORD = "Wrong password, please enter the correct password";
    static let PROBLEM_CONNECTING = "Problem connecting to the database";
    static let USER_NOT_FOUND = "User not found, please sign up";
    static let EMAIL_ALREADY_IN_USE = "Email already in use, please use another Email";
    static let WEAK_PASSWORD = "Password should be at least 6 characters long";
}

class SignInVC: UIViewController {
    
    private let CONTACTS_SEGUE = "ContactsSegue";
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()


    
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        
        if (emailTextField.text != nil && passwordTextField.text != nil) {
            
            AuthProvider.Instance.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
            
                if message != nil {
                    self.alertTheUser(title: "Problem with authentication", message: message!);
                } else {
                    print("Login completed");
                }
                
            });
            
        }
        
    }

    @IBAction func signUp(_ sender: Any) {
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        
        present(alert, animated: true, completion: nil);
    }
    
}

// class
