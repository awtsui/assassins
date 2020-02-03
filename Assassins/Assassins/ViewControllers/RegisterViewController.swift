//
//  RegisterViewController.swift
//  Assassins
//
//  Created by Alvin Tsui on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickRegisterButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            let signUpManager = FirebaseAuthManager()
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                    
                    let storyboard = UIStoryboard(name: "Auth", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")
                    self.present(controller, animated: true, completion: nil)

                    // Safe Present
                    if let vc = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
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
        

    }
    
    func display(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
