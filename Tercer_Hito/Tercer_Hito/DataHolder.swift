//
//  DataHolder.swift
//  TrabajoFinal
//
//  Created by GUILLERMO CRESPO AGUAYO on 10/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var fireStoreDB:Firestore?
    var miPerfil: Perfil=Perfil()
    var arCiudades: [City] = NSArray() as! [City]
    var vcPrincipal:VCPrincipal?
    var vcColeccion:VCColeccion?
    var HMIimagen:[String:UIImage]=[:]
    var userdb:User?
    
    var firStorage:Storage?
    func initFireBase(){
        FirebaseApp.configure()
        fireStoreDB=Firestore.firestore()
        firStorage=Storage.storage()
    }
    
    
    
    func descargarCiudades(delegate:DataHolderDelegate){
            DataHolder.sharedInstance.fireStoreDB?.collection("animales").addSnapshotListener  { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.arCiudades=[]
                    for document in querySnapshot!.documents {
                        
                        let ciudad: City=City()
                        ciudad.sID = document.documentID
                        ciudad.setMap(valores: document.data())
                        self.arCiudades.append(ciudad)
                        print("\(document.documentID) => \(document.data())")
                    }
                    print("-------->",self.arCiudades.count )
                    delegate.DHDdescargaCiudadesCompleta!(blFin:true)
                    //self.tbMiTable?.reloadData()
                }
    }
   
}
    func Login(txtUser:String, textPass:String, delegate:DataHolderDelegate){
        Auth.auth().signIn(withEmail: (txtUser), password:
        (textPass)) {(user, error) in
            if user != nil{
                self.userdb=user
                // print("ENTRO")
                let ruta =
                    DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument{ (document, error) in
                    if document != nil{
                        print("ENTRO")
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        delegate.DHDLogin!(blFin: true)
                        print(document?.data() as Any)
                        //self.performSegue(withIdentifier: "trlogin", sender: self)
                        
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
    func Registro(txtEmail:String, txtPass:String,txtPassConfirm:String,txtLatitude:String, txtLongitud:String,delegate:DataHolderDelegate){
        
        //if txtPass.text==txtPassConfirm?.text{
        
        Auth.auth().createUser(withEmail:(txtEmail),password:(txtPass)){ (user, error) in
        if user != nil {
            
        print("TE REGISTRARSE")
        
        
        self.userdb=user
            delegate.DHDRegister!(blFin: true)
       DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(
       DataHolder.sharedInstance.miPerfil.getMap()
        
        
        /*[
         "nombre": self.txtUser?.text! as Any,
         "email": self.txtEmail?.text as Any,
         "contrasena": self.txtPass?.text as Any
         ]
         */
        )
        }
        else{
        print(error!)
        }
        
       
        }
    }




}
@objc protocol DataHolderDelegate{
    @objc optional func DHDdescargaCiudadesCompleta(blFin:Bool)
    @objc optional func DHDLogin (blFin:Bool)
    @objc optional func DHDRegister (blFin:Bool)
    
    
}
