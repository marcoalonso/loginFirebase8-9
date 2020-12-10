//
//  MenuPrincipalViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 09/12/20.
//

import UIKit
import Firebase

class MenuPrincipalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
   
    

    @IBAction func cerrarSesionButton(_ sender: UIBarButtonItem) {
    
    do {
        try Auth.auth().signOut()
        //cerro sesion exitosamente
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
    }
   

}
