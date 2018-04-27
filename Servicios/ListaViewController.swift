//
//  Lista.swift
//  Servicios
//
//  Created by william ricardo  on 12/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import SideMenu



class ListaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    ////////array donde se guardan los datos\\\\\\\\\\\\\\\\\
    var listData = [[String: Any]]()
    
    
    
   var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var apellido: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    

     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.tableView.dataSource = self
       self.tableView.delegate = self
        ///////////Peticion\\\\\\\\\\\\\\\\
        let headers: HTTPHeaders = [ "Authorization":"authToken"]
        
         let url: String = ("http://directotesting.igapps.co/sch/prospects.json")
    
        Alamofire.request(url,  headers: headers).responseJSON(completionHandler: { response in
            
            switch response.result {
                
            case .success:
              self.listData = response.result.value as! [[String: Any]]
                self.tableView.reloadData()
            case .failure(let error ):
                print (error)
               }
            })
       
        
        tableView.reloadData()
        
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
/////////Especificar numero de celdas, count cantidad almacenada en array\\\\\\\\\\\\\\\\\
 return listData.count
    }
  /////// recorrer array mostrar elementos\\\\\\\\\\\\
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath ) as! TableViewCell
        let item = self.listData[indexPath.row]
     ///////// Guardar datos de la lista\\\\\\\\\\\
        let list = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)
         list.setValue(cell.nombre.text!, forKey: "name")
         list.setValue(cell.apellido.text!, forKey: "surname")
         list.setValue(cell.cedula?.text, forKey:"schProspectIdentification")
        list.setValue(cell.telefono?.text, forKey: "telephone")
        do{
            try context.save()
            print("Guardado")
        }
        catch{
            print(error.localizedDescription)
            
        }
/////////labels donde se muestras los datos\\\\\\\\\\\\\\\\
    cell.nombre?.text = item ["name"] as? String
    cell.apellido?.text = item ["surname"] as? String
    cell.cedula?.text = item ["schProspectIdentification"] as? String
    cell.telefono?.text = item ["telephone"] as? String
    cell.estado?.text = item ["statusCd"] as? String
     
       return cell
    }
/////////////// Boton de editar  //////////////
    @IBAction func editar(_ sender: UIButton) {
        
       
        
        if  let url: String = ("http://directotesting.igapps.co/sch/prospects"){
            /*let Auth_header: [String:String] = ["Accept":"application/json", "Content-Type" : "application/json", "Authorization":"authToken"]*/
        
            Alamofire.request(url, method: .get,encoding: URLEncoding.queryString).responseJSON
 { response in
            //self.listData = response.result.value as! [[String: AnyObject]]
            print("Request: \(String(describing: response.request))")   // solicitud original de la url
            print("Response: \(String(describing: response.response))") // http url respuesta
            print("Result: \(response.result)") //respuesta de la realizacion
        self.performSegue(withIdentifier: "Editar", sender: self)
    }
   }
 }
}
