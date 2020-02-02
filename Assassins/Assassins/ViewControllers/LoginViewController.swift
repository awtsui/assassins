//
//  LoginViewController.swift
//  Assassins
//
//  Created by Joshua Liu on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    
    @objc func keyboardWillShow(notification:NSNotification){

        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.textScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height - 50
        textScrollView.contentInset = contentInset //+ 20
    }

    @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        textScrollView.contentInset = contentInset
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    

        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var textScrollView: UIScrollView!
    
    
        
        
        
    func loginOnPress(_ sender: UIButton) {
            // Take email and pw text fields, check against
            // a database
            // If in database, segue to Create/join game Storyboard
            // else dont segue and error msg
    
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
}
