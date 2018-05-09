//
//  VCPrincipal.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 5/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController, UITableViewDelegate, UITableViewDataSource,DataHolderDelegate {
    
    @IBOutlet var tbMiTable:UITableView?

    
  /*  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        return cell
    }
    
*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
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
                    //self.tbMiTable?.reloadData()
                    self.refreshUI()
                    
                }

        }        // Do any additional setup after loading the view.
        */
        
        DataHolder.sharedInstance.vcPrincipal = self
        DataHolder.sharedInstance.descargarCiudades(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DHDdescargaCiudadesCompleta(blFin: Bool) {
        if blFin{
            refreshUI()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arAnimales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        
           // cell.lblNombre?.text = self.arCiudades[indexPath.row].sNombre
            //cell.mostrarImagen(uri: self.arCiudades[indexPath.row].sImagen!)
        
        cell.lblNombre?.text=DataHolder.sharedInstance.arAnimales[indexPath.row].sNombre
        cell.mostrarImagen(uri: DataHolder.sharedInstance.arAnimales[indexPath.row].sImagen!)
      
        return cell
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute:  {
            self.tbMiTable?.reloadData()
        })
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
