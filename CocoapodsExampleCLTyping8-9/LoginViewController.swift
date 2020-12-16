//
//  LoginViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 08/12/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogInButton(_ sender: UIButton) {
        if let correo = correoTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: correo, password: password) {  authResult, error in
              
                if let error = error {
                    if error.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted." {
                        print("El correo ingresado no esta registrado")
                    } else if error.localizedDescription == "The email address is badly formatted." {
                        print("verifica tu correo electronico este bien escrito")
                    }
                    print("Hubo un error al tratar de iniciar sesion \(error.localizedDescription)")
                } else {
                    self.performSegue(withIdentifier: "loginMenu", sender: self)
                }
              // ...
            }
        }
    }
    

}
