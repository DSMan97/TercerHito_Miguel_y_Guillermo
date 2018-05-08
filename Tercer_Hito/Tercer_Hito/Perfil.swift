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
    let IDLatitud = "latitud"
    let IDLongitud = "longitud"
   
    
    var sNombre:String?
    var sEmail:String?
    var dLatitud:Double?
    var dLongitud:Double?
    
    func setMap(valores:[String:Any]){
        sNombre = valores[IDnombre] as? String
        sEmail = valores[IDEmail] as? String
        dLatitud = valores[IDLatitud] as? Double
        dLongitud = valores[IDLongitud] as? Double
        
      
    }
    
    func getMap () -> [String:Any] {
        return[
            "Nombre": sNombre as Any,
            "Email": sEmail as Any,
            "latitud": dLatitud as Any,
            "longitud": dLongitud as Any,
            
        ]
    }
    
}

