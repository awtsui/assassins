//
//  CreateViewController.swift
//  Assassins
//
//  Created by Alvin Tsui on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var gameNameTextField: UITextField!
    @IBOutlet weak var gameIDTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createOnPress(_ sender: UIButton) {
        if let username = usernameTextField.text, let gamename = gameNameTextField.text, let gameid = gameIDTextField.text{
    
            let db = Firestore.firestore()
            db.collection("games").document(gameid).setData([
                "gamename": gamename
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            db.collection("games").document(gameid).collection(username).addDocument(data:
                    ["status": "godfather"]
            ){ err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
        
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
