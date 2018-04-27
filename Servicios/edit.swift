//
//  edit.swift
//  Servicios
//
//  Created by william ricardo  on 13/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class edit: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
 var listData: [[String: AnyObject]] = [[String: AnyObject]] ()
 
 

    
 var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 

 
 @IBOutlet weak var tableView: UITableView!
 
 
 
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 self.tableView.dataSource = self
 self.tableView.delegate = self
 ///////////Peticion\\\\\\\\\\\\\\\\
 let url: String = ("http://directotesting.igapps.co/sch/prospects.json")
 Alamofire.request(url).responseJSON(completionHandler: { response in
 
 switch response.result {
 
 case .success:
 self.listData = response.result.value as! [[String: AnyObject]]
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
 let Celda = tableView.dequeueReusableCell(withIdentifier: "Celda" , for: indexPath ) as! ModificarTableViewCell
 let item = self.listData[indexPath.row]

 /////////labels donde se muestras los datos\\\\\\\\\\\\\\\\
 Celda.nombreEdit?.text = item ["name"] as? String
 Celda.ApellidoEdit?.text = item ["surname"] as? String
 Celda.cedulaedit?.text = item ["schProspectIdentification"] as? String
 Celda.telefonoEdit?.text = item ["telephone"] as? String
// Celda.estado?.text = item ["statusCd"] as? String
 
 return Celda
 }
 /////////////// Boton de editar  //////////////
   // @IBAction func Enviar(_ sender: UIButton) {
 
 
 


    
  }

