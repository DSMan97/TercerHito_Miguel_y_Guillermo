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
    var firStorage:Storage?
    func initFireBase(){
        FirebaseApp.configure()
        fireStoreDB=Firestore.firestore()
        firStorage=Storage.storage()
        /*
        let ciudadesRef = fireStoreDB?.collection("animales")
        
        ciudadesRef?.document("MAD").setData([
            "nombre": "Madrid",
            "capital": "Madrid",
            "país": "España",
            "escapital": true
            ])
        ciudadesRef?.document("BAR").setData([
            "nombre": "Catalunya",
            "capital": "Barcelona",
            "país": "España",
            "escapital": false
            ])
        ciudadesRef?.document("SEV").setData([
            "nombre": "Andalucia",
            "capital": "Sevilla",
            "país": "España",
            "escapital": false
            ])
        ciudadesRef?.document("CACE").setData([
            "nombre": "Extremadura",
            "capital": "Cáceres",
            "país": "España",
            "escapital": false
            ])
        */
    }
    
}

