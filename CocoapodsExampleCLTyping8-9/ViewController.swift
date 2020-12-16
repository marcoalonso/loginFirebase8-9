//
//  ViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 07/12/20.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validateAuth()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "isLogedMenu", sender: self)
        }
    }
    

}

