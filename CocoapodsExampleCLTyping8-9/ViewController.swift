//
//  ViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 07/12/20.
//

import UIKit
import CLTypingLabel
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var textBienvenidaLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBienvenidaLabel.charInterval = 0.09
        textBienvenidaLabel.text = "Hola bienvenidos al Instituto Tecnologico de Morelia y a la materia de programacion movil II"
        
        validarUserLogueado()
    }
    
    func validarUserLogueado() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            //Si esta logueado un usuario
            performSegue(withIdentifier: "LogueadoMenu", sender: self)
        }
    }


}

