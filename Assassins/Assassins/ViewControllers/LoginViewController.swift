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
        
        
    @IBAction func loginOnPress(_ sender: UIButton) {
        // Take email and pw text fields, check against
            // a database
            // If in database, segue to Create/join game Storyboard
            // else dont segue and error msg
        let loginManager = FirebaseAuthManager()
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
                message = "User was sucessfully logged in."
                
                let storyboard = UIStoryboard(name: "CreateJoinGame", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "CreateJoinVC")
                self.present(controller, animated: true, completion: nil)

                // Safe Present
                if let vc = UIStoryboard(name: "CreateJoinGame", bundle: nil).instantiateViewController(withIdentifier: "CreateJoinVC") as? CreateJoinViewController
                {
                    self.present(vc, animated: true, completion: nil)
                }
            } else {
                message = "There was an error."
                
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.display(alertController: alertController)
            }
        }
    }
    
    func display(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true

    }
}
