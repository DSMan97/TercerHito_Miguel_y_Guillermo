//
//  LocationAdmin.swift
//  Tercer_Hito
//
//  Created by GUILLERMO CRESPO AGUAYO on 8/5/18.
//  Copyright © 2018 GUILLERMO CRESPO AGUAYO. All rights reserved.
//

import UIKit
import CoreLocation
class LocationAdmin: NSObject, CLLocationManagerDelegate {
    var locationmanager:CLLocationManager?
    var delegate:LocationAdminDelegate?

    override init(){
        super.init()
        locationmanager=CLLocationManager()
        locationmanager?.delegate=self
        locationmanager?.requestWhenInUseAuthorization()
        locationmanager?.startUpdatingLocation()
    }
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print("esta es mi posición actual:","Lat:",locations[0].coordinate.latitude,"Long",locations[0].coordinate.longitude)
        delegate?.localizacionActualizar(coordenadas: locations[0].coordinate)
    }
}

protocol LocationAdminDelegate {
    func localizacionActualizar(coordenadas:CLLocationCoordinate2D)
}
