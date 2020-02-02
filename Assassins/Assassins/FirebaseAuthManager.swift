//
//  FirebaseAuthManager.swift
//  Assassins
//
//  Created by Alvin Tsui on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import FirebaseAuth
import UIKit

class FirebaseAuthManager {
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                completionBlock(false)
            } else {
                print(authResult?.user)
                completionBlock(true)
            }
        }
    }
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
}
