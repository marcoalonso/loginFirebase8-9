//
//  RegistrarUsuariosViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 08/12/20.
//

import UIKit
import FirebaseAuth

class RegistrarUsuariosViewController: UIViewController {

    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registrarButton(_ sender: UIButton) {
        if let email = correoTextField.text, let password = contraseñaTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                guard let resultado = authResult, error == nil else {
                    guard let error = error else {
                    return
                }
                    if error.localizedDescription == "The email address is already in use by another account." {
                        self.alertaUsuario(msj: "El correo electronico ya esta registrado")
                    }
                    print(error.localizedDescription)
                    return
                }
                print("Usuario registrado en bd \(resultado.user)")
                self.performSegue(withIdentifier: "registroMenu", sender: self)
            }
        }
        
    }
    
    func alertaUsuario(msj: String) {
        let alerta = UIAlertController(title: "Ups!", message: msj, preferredStyle: .alert)
        let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(accion)
        present(alerta, animated: true, completion: nil)
    }
    
}
