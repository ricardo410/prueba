//
//  Prospectos.swift
//  Servicios
//
//  Created by william ricardo  on 9/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit
import Foundation
import Alamofire

typealias JSON = [String : Any]
class Prospectos: BaseViewController {
    

   

    override func viewDidLoad() {
        super.viewDidLoad()
      addSlideMenuButton()
        
        Alamofire.request("http://directotesting.igapps.co/sch/prospects.json").responseJSON { response in
            if let json = response.result.value as? JSON {
                
                print (json)
                
                
            }
        
    }
        
    }
    

    override func didReceiveMemoryWarning() {
      
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
