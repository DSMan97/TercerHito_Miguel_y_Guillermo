//
//  City.swift
//  TrabajoFinal
//
//  Created by GUILLERMO CRESPO AGUAYO on 19/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit

class City: NSObject {
    
    let IDnombre = "Nombre"
    let IDImagen = "Imagen"
    
    var sID:String?
    var sNombre:String?
    var sImagen:String?
    
    func setMap(valores:[String:Any]){
        sNombre = valores[IDnombre] as? String
        sImagen = valores[IDImagen] as? String
        
        if sImagen == nil{
            sImagen="gs://segundo-hito-8bb55.appspot.com/perro.png"
        }
    }
    
    func getMap () -> [String:Any] {
        return[
            "Nombre": sNombre as Any,
            "Imagen":sImagen as Any
        ]
    }
    
    

}
