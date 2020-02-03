//
//  JoinViewController.swift
//  Assassins
//
//  Created by Alvin Tsui on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import UIKit
import Firebase

class JoinViewController: UIViewController {
    

    @IBOutlet weak var gameIDTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func joinOnPress(_ sender: UIButton) {
        if let username = usernameTextField.text, let gameid = gameIDTextField.text{
            let db = Firestore.firestore()
            let games = db.collection("games")
            let docRef = games.document(gameid)
            
            
            docRef.getDocument { (document, error) in
                if let document = document {
                    if document.exists{
                        games.document(gameid).collection(username).addDocument(data: [
                            "status": "alive"]){ err in
                            if let err = err {
                                print("Error writing document: \(err)")
                            } else {
                                print("Document successfully written!")
                            }
                        }
                        
                        let storyboard = UIStoryboard(name: "PlayerGame", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "LobbyVC")
                        self.present(controller, animated: true, completion: nil)

                        // Safe Present
                        if let vc = UIStoryboard(name: "PlayerGame", bundle: nil).instantiateViewController(withIdentifier: "LobbyVC") as? CreateJoinViewController
                        {
                            self.present(vc, animated: true, completion: nil)
                        }

                    } else {
                        
                        let alertController = UIAlertController(title: nil, message: "Game does not exist", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.display(alertController: alertController)
                    }
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
