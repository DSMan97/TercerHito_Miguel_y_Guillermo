//
//  ViewController.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 5/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth
class ViewController: UIViewController {
    
    @IBOutlet var lblPrueba:UILabel?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var btnRegister:UIButton?
    
   
    
    override func viewDidLoad() {
        btnLogin?.layer.cornerRadius = 10
        btnRegister?.layer.cornerRadius = 10
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         DataHolder.sharedInstance.miPerfil.sNombre = txtUser?.text
         DataHolder.sharedInstance.miPerfil.sNombre = txtPass?.text
        
        
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func eventoClickLogin(){
        Auth.auth().signIn(withEmail: (txtUser?.text)!, password:
        (txtPass?.text)!) {(user, error) in
            if user != nil{
               // print("ENTRO")
                let ruta =
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument{ (document, error) in
                    if document != nil{
                        print("ENTRO")
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        print(document?.data() as Any)
                        self.performSegue(withIdentifier: "trlogin", sender: self)
                    }
                    else{
                        print(error!)
                    }
                }
                
            }
            else{
                print("NO SE HA LOGUEADO")
                print(error!)
            }
        }
        //Auth.auth().addStateDidChangeListener { (auth, user) in
         
            //self.performSegue(withIdentifier: "trlogin", sender: self)
        //}
        
        
        
    }
    
}

