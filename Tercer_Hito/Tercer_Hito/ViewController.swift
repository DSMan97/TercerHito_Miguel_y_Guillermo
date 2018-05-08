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
class ViewController: UIViewController, DataHolderDelegate {
    
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
    func DHDLogin(blFin: Bool){
        
        if blFin{
            self.performSegue(withIdentifier: "trlogin", sender: self)
            print("Register Correcto")
        }
        print("Registro Incorrecto")
    }
    @IBAction func eventoClickLogin(){
        DataHolder.sharedInstance.Login(txtUser: (txtUser?.text)!, textPass: (txtPass?.text)!, delegate: self)
        
        
    }
    
}

