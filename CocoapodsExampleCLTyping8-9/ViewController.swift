//
//  ViewController.swift
//  CocoapodsExampleCLTyping8-9
//
//  Created by marco alonso on 07/12/20.
//

import UIKit
<<<<<<< HEAD
import CLTypingLabel
import FirebaseAuth
=======
import Firebase
>>>>>>> 3998de669b3297c056a38d224b6293aea4ebcee8

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
        textBienvenidaLabel.charInterval = 0.09
        textBienvenidaLabel.text = "Hola bienvenidos al Instituto Tecnologico de Morelia y a la materia de programacion movil II"
        
        validarUserLogueado()
    }
    
    func validarUserLogueado() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            //Si esta logueado un usuario
            performSegue(withIdentifier: "LogueadoMenu", sender: self)
        }
=======
        validateAuth()
>>>>>>> 3998de669b3297c056a38d224b6293aea4ebcee8
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "isLogedMenu", sender: self)
        }
    }
    

}

