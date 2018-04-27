//
//  ModificarTableViewCell.swift
//  Servicios
//
//  Created by william ricardo  on 15/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit
import Alamofire

class ModificarTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cedulaedit: UILabel!
    
    
    @IBOutlet weak var nombreEdit: UITextField!
    
    @IBOutlet weak var ApellidoEdit: UITextField!
    
    @IBOutlet weak var telefonoEdit: UITextField!
    
    @IBAction func Editar(_ sender: Any) {
    
        let nombre = "nombre"
        let apellido = "apellido"
        let telefono = "telefono"
       
if  let url: String = ("http://directotesting.igapps.co/sch/prospects"){
   // let params: Parameters = ["nombre":self.nombreEdit.text!,"apellido":self.ApellidoEdit.text!,"telefono": self.telefonoEdit.text!]
            
            Alamofire.request(url, encoding: URLEncoding.default).responseJSON { response in
                //self.listData = response.result.value as! [[String: AnyObject]]
                print("Request: \(String(describing: response.request))")   // solicitud original de la url
                print("Response: \(String(describing: response.response))") // http url respuesta
                print("Result: \(response.result)") //respuesta de la realizacion
                
                // let telefono = "telefono"
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
