//
//  VCColeccion.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 5/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var arCiudades: [City] = NSArray() as! [City]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.arCiudades.count 
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMicelda2=collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as! CVCMicelda2
        
        
            
            cell.lblNombre?.text = self.arCiudades[indexPath.row].sNombre
            cell.mostrarImagen(uri: self.arCiudades[indexPath.row].sImagen!)
     
          /*
        if(indexPath.row==0){
            cell.imgagen?.image=UIImage(named: "gato.png")
            cell.lblNombre?.text="Gato"
        }
        else if(indexPath.row==1){
            cell.imgagen?.image=UIImage(named: "perro.png")
            cell.lblNombre?.text="Perro"
        }
        else if(indexPath.row==2){
            cell.imgagen?.image=UIImage(named: "caballo.png")
            cell.lblNombre?.text="Caballo"
        }
        else if(indexPath.row==3){
            cell.imgagen?.image=UIImage(named: "huron.png")
            cell.lblNombre?.text="Hurón"
        }
        else if(indexPath.row==4){
            cell.imgagen?.image=UIImage(named: "canario.png")
            cell.lblNombre?.text="Canario"
        } */
        return cell
    }
    @IBOutlet var colPrincipal:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
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
            
        }           // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute:  {
            self.colPrincipal?.reloadData()
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

