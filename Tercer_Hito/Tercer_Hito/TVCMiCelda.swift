//
//  TVCMiCelda.swift
//  TrabajoFinal
//
//  Created by Miguel Angel Martinez Gonzalez on 5/4/18.
//  Copyright © 2018 Miguel Angel Martinez Gonzalez. All rights reserved.
//

import UIKit

class TVCMiCelda: UITableViewCell {

    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imagen:UIImageView?
    var imagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func mostrarImagen(uri:String){
        self.imagen?.image = nil
        // Create a reference to the file you want to download
        //if imagenDescargada == nil {
        let imagenDescargada2 = DataHolder.sharedInstance.HMIimagen[uri]
        if (imagenDescargada2 != nil){
            self.imagen?.image = imagenDescargada2
        }else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    self.imagenDescargada = UIImage(data: data!)
                    self.imagen?.image = self.imagenDescargada
                    DataHolder.sharedInstance.HMIimagen[uri]=self.imagenDescargada
                }
            }
        }
        
    }
    
}
