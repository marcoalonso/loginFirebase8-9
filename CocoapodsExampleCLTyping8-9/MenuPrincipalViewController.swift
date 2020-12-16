//
//  MenuPrincipalViewController.swift
//  CocoapodsExampleCLTyping8-9
//
<<<<<<< HEAD
//  Created by marco alonso on 14/12/20.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

var contactos = [String]()

class MenuPrincipalViewController: UIViewController {
    @IBOutlet weak var tabla: UITableView!
    
=======
//  Created by marco alonso on 09/12/20.
//

import UIKit
import Firebase

class MenuPrincipalViewController: UIViewController {

>>>>>>> 3998de669b3297c056a38d224b6293aea4ebcee8
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
<<<<<<< HEAD
        
        cargarContactos()
    }
    
    func cargarContactos(){
        let db = Firestore.firestore()
        db.collection("contactos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Hubo un error al obtener los documentos \(err.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) --> \(document.data())")
                }
            }
        }
    }
    
    @IBAction func cerrarSesionButton(_ sender: UIBarButtonItem) {
        
    do {
      try Auth.auth().signOut()
        // se cerro la sesison
        print("se cerro la sesison correctamente")
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
      print ("Error al cerrar sesion : %@", signOutError)
    }
    }
    
    @IBAction func agregarButton(_ sender: UIBarButtonItem) {
        agregarContacto()
    }
    func agregarContacto(){
        let alert = UIAlertController(title: "Nuevo Contacto", message: "Crear", preferredStyle: .alert)
        alert.addTextField{ (nombreAlerta) in
            nombreAlerta.placeholder = "Nombre"
        }
        alert.addTextField{ (telefonoAlerta) in
            telefonoAlerta.placeholder = "telefono"
        }
        let accionAceptar = UIAlertAction(title: "Agregar", style: .default, handler: { _ in
            guard let nombreAlert = alert.textFields?.first?.text else { return }
            guard let telefonoAlert = alert.textFields?.last?.text else { return }
            
            //insertar datos en Firebase
            let db = Firestore.firestore()
            db.collection("contactos").addDocument(data: ["nombre": nombreAlert, "telefono": telefonoAlert])
            
        })
        
        alert.addAction(accionAceptar)
        present(alert, animated: true, completion: nil)
    }

}

extension MenuPrincipalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        celda.textLabel?.text = "Hola"
        return celda
    }
    
    
=======
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
>>>>>>> 3998de669b3297c056a38d224b6293aea4ebcee8
}
