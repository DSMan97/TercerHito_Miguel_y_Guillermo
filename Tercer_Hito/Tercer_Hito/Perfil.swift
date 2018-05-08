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
    var dLatitud:String?
    var dLongitud:String?
    
    func setMap(valores:[String:Any]){
        sNombre = valores[IDnombre] as? String
        sEmail = valores[IDEmail] as? String
        dLatitud = valores[IDLatitud] as? String
        dLongitud = valores[IDLongitud] as? String
        
      
    }
    
    func getMap () -> [String:Any] {
        return[
            "Nombre": sNombre as Any,
            "Email": sEmail as Any,
            "Latitud": dLatitud as Any,
            "Longitud": dLongitud as Any,
            
        ]
    }
    
}

