//
//  IniciarSesionViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 09/12/20.
//

import UIKit
import FirebaseAuth

class IniciarSesionViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = correoTextField.text,
           let password = passwordTextField.text {
            //Iniciar sesion en firebase
            Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                guard let result = authResult, error == nil else{
                    print("Error al iniciar sesison \(email)")
                    self.alertUserLoginError()
                    return
                } // Valida que se logue en firebase y no haya errore
                let user = result.user
                print("\(user) correctamente logueado!")
                self.performSegue(withIdentifier: "loginMenu", sender: self)
            } // fin validacion en FireBase
        } // fin if let
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Oh!", message: "¡Favor de verificar  los datos para introducidos!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }
    
    

}
