//
//  APIManager.swift
//  Servicios
//
//  Created by william ricardo  on 13/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

/*import Foundation
import Alamofire
import PromiseKit


class APIManager {
    
    static let shared = APIManager ()
    
    private init() {
        
    }
    
    
    func traerUsuarios() -> Promise<[user]> {
        
        return Promise<[user]>{
            fullfil,reject -> Void in
            
            return Alamofire.request("http://directotesting.igapps.co/sch/prospects.json").responseString(){
                response in
                
            switch (response.result){
                
            case .success(let responseString):
                print(responseString)
               // let bien = importar(JSONString:"\(responseString)")
              //  fullfil(bien.users!)
            case .failure(let error):
                print(error)
                reject(error)
            }
             }
         }
    }

    }*/


