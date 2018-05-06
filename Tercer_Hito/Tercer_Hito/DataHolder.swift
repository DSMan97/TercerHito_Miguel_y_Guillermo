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

}

@objc protocol DataHolderDelegate{
    @objc optional func DHDdescargaCiudadesCompleta(blFin:Bool)
}
