//
//  VCMap.swift
//  TrabajoFinal
//
//  Created by GUILLERMO CRESPO AGUAYO on 19/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMap: UIViewController, CLLocationManagerDelegate, DataHolderDelegate {

    @IBOutlet var MiMapa:MKMapView?
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.descargarCiudades(delegate: self)
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        MiMapa?.showsUserLocation = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        self.nuevaRegionMapa(latitude: locations[0].coordinate.latitude, longitud: locations[0].coordinate.longitude)
    }
    
    func nuevaRegionMapa(latitude lat: Double, longitud lon:Double){
        let miSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
        let puntoCentro:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let miRegion:MKCoordinateRegion = MKCoordinateRegion(center: puntoCentro, span: miSpan)
        
        MiMapa?.setRegion(miRegion, animated: true)
    }
    
    func DHDdescargaCiudadesCompleta(blFin: Bool) {
        if blFin{
            for animales in DataHolder.sharedInstance.arAnimales{
                if (animales.dLatitud != nil){
                    self.agregarPin(titulo: animales.sNombre!, latitude: animales.dLatitud!, longitude: animales.dLongitud!)
                }
            }
    }
        
}
    func agregarPin(titulo:String, latitude lat:Double, longitude lon:Double ){
        
        let miPin:MKPointAnnotation = MKPointAnnotation()
        miPin.coordinate.latitude = lat
        miPin.coordinate.longitude = lon
        miPin.title = titulo
        MiMapa?.addAnnotation(miPin)
        self.agregarPin()
    }
    
    func agregarPin(){
        print("Agregando pines")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
