//
//  AuthProvider.swift
//  FireTweety
//
//  Created by Ivan Cernja on 30/04/2017.
//  Copyright © 2017 Ivan Cernja. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthProvider {
    
    private static let _instance = AuthProvider();
    
    static var Instance: AuthProvider {
        return _instance;
    }
    
    func signIn(withEmail: String, password: String, loginHandler: LoginHandler?) {
        
        FIRAuth.auth()?.signIn(withEmail: withEmail, password: password, completion: { (user, error) in
            
            if error != nil {
                
                self.handleErrors(err: error as! NSError, loginHandler: loginHandler);
                
            } else {
                loginHandler?(nil);
            }
            
            
        });
        
    } //login func
    
    private func handleErrors(err: NSError, loginHandler: LoginHandler?) {
        
        if let errCode = FIRAuthErrorCode(rawValue: err.code) {
            
            switch errCode {
                
            case.errorCodeWrongPassword:
                loginHandler!(LoginErrorCode.WRONG_PASSWORD);
                break;
                
            case.errorCodeInvalidEmail:
                loginHandler!(LoginErrorCode.INVALID_EMAIL);
                break;
                
            case.errorCodeUserNotFound:
                loginHandler!(LoginErrorCode.USER_NOT_FOUND);
                break;
                
            case.errorCodeEmailAlreadyInUse:
                loginHandler!(LoginErrorCode.EMAIL_ALREADY_IN_USE);
                break;
            
            case.errorCodeWeakPassword:
                loginHandler!(LoginErrorCode.WEAK_PASSWORD);
                break;
                
            default:
            break;
            
            }
            
            
        }
        
    }
    
}

//class
