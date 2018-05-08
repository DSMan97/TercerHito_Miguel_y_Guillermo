//
//  Perfil.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 12/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    
    let IDnombre = "Nombre"
    let IDEmail = "Email"
    let IDLatitud = "Latitud"
    let IDLongitud = "Longitud"
   
    
    var sNombre:String?
    var sEmail:String?
    var iLatitud:String?
    var iLongitud:String?
    
    func setMap(valores:[String:Any]){
        sNombre = valores[IDnombre] as? String
        sEmail = valores[IDEmail] as? String
        iLatitud = valores[IDLatitud] as? String
        iLongitud = valores[IDLongitud] as? String
        
      
    }
    
    func getMap () -> [String:Any] {
        return[
            "Nombre": sNombre as Any,
            "Email": sEmail as Any,
            "Latitud": iLatitud as Any,
            "Longitud": iLongitud as Any,
            
        ]
    }
    
}

