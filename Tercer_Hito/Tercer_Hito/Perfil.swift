//
//  Perfil.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 12/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    
    let IDnombre = "nombre"
    let IDEmail = "email"
   
    
    var sNombre:String?
    var sEmail:String?
    
    func setMap(valores:[String:Any]){
        sNombre = valores[IDnombre] as? String
        sEmail = valores[IDEmail] as? String
        
        
      
    }
    
    func getMap () -> [String:Any] {
        return[
            "nombre": sNombre as Any,
            "email": sEmail as Any,
            
        ]
    }
    
}

