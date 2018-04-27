//
//  TableViewCell.swift
//  Servicios
//
//  Created by william ricardo  on 12/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
   @IBOutlet weak var apellido: UILabel!
   @IBOutlet weak var telefono: UILabel!
   @IBOutlet weak var cedula: UILabel!
   

   @IBOutlet weak var estado: UILabel!
   
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
