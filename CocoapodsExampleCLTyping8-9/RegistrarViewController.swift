//
//  RegistrarViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 09/12/20.
//

import UIKit
import FirebaseAuth

class RegistrarViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registrarButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                guard let result = authResult, error == nil else{
                    guard let error = error else {
                        return
                    }
                    print(error.localizedDescription)
                    switch error.localizedDescription {
                    case "An email address must be provided.":
                        self.alertUserLoginError(msjError: "Introduce un correo electrónico, por favor!")
                    case "The email address is already in use by another account.":
                        self.alertUserLoginError(msjError: "¡El correo que intentas registrar ya esta dado de alta!")
                    case "The password must be 6 characters long or more.":
                        self.alertUserLoginError(msjError: "¡Favor de introducir una contraseña más segura (mínimo 6 caracteres)")
                    case "The email address is badly formatted.":
                        self.alertUserLoginError(msjError: "Ingresa un correo valido!")
                    default:
                        self.alertUserLoginError(msjError: "Ocurrio un error al crear el usuario, por favor intenta nuevamente")
                    }
                    return
                }
                print(result.user)
                //ir al menu principal
                self.performSegue(withIdentifier: "registroToMenu", sender: self)
            }
        }
    }
    func alertUserLoginError(msjError: String) {
        let alert = UIAlertController(title: "¡Upps!", message: msjError, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }
    

}
