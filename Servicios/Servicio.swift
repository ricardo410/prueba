//
//  Servicio.swift
//  Servicios
//
//  Created by william ricardo  on 12/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String:Any]


class servicio {

    
static let shared = servicio ()
    private init() {}
    
func traerProspectos (completion: () -> Void) {
    
    Alamofire.request("http://directotesting.igapps.co/sch/prospects.json").responseJSON { response in
        if let json = response.result.value as? JSON {
            
        print (json)
            
            
        }
        
        
        
        
        
    }
    
}
    
    extension ViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        
    }
    
    

}
