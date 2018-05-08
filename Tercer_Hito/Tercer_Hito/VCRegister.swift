//
//  VCRegister.swift
//  TrabajoFinal
//
//  Created by GUILLERMO CRESPO AGUAYO on 12/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth
class VCRegister: UIViewController, DataHolderDelegate {
    
    @IBOutlet var txtUser:UITextField?
    @IBOutlet  var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtPassConfirm:UITextField?
    @IBOutlet var txtLatitude:UITextField?
    @IBOutlet var txtLong:UITextField?
    @IBOutlet var btnlAceptar:UIButton?
    @IBOutlet var btnCancelar:UIButton?
    
    
    
    override func viewDidLoad() {
        btnlAceptar?.layer.cornerRadius = 10;
        btnCancelar?.layer.cornerRadius = 10;
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func DHDRegister(blFin: Bool){
        
        if blFin{
            self.performSegue(withIdentifier: "trregister", sender: self)
            print("Register Correcto")
        }
        print("Registro Incorrecto")
    }
   @IBAction func clickRegistar(){
    //esto es de prueba y debe ser cambiado
        DataHolder.sharedInstance.miPerfil.sNombre = txtUser?.text
        DataHolder.sharedInstance.miPerfil.sEmail = txtEmail?.text
        let castStrLat:String = (txtLatitude?.text)!
        DataHolder.sharedInstance.miPerfil.dLatitud = Double(castStrLat)
        let castStrLong:String = (txtLong?.text)!
        DataHolder.sharedInstance.miPerfil.dLongitud = Double(castStrLong)
    
    if self.txtPass?.text==self.txtPassConfirm?.text {
        
        
            
        DataHolder.sharedInstance.Registro(txtEmail: (txtEmail?.text)!, txtPass: (txtPass?.text)!, txtPassConfirm:(txtPassConfirm?.text)!, txtLatitude: (txtLatitude?.text)!, txtLongitud:(txtLong?.text)!, delegate: self)
       
        
        
    }else{
        print("Las contraseñas no son iguales")
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
}
