//
//  TableViewController.swift
//  Servicios
//
//  Created by william ricardo  on 12/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

/*import UIKit
import Alamofire

class TableViewController: UITableViewController {

    @IBOutlet weak var lista: UITableView!
    
    var jsonArray: NSArray?
    var nombreArray: Array <String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url: String = "http://directotesting.igapps.co/sch/prospects.json"
        Alamofire.request(url)
            .responseJSON { response in
                // handle JSON
            }
            .responseString { response in
                if let error = response.result.error {
                    print(error)
                }
                if let value = response.result.value {
                    print(value)
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.nombreArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.nombre.text? = self.nombreArray[indexPath.row]
        
        
        
        return cell
    }

    func dowloadDataFromAPi() {
        
        Alamofire.request("http://directotesting.igapps.co/sch/prospects.json").responseJSON { response in
            
            if let JSON = response.result.value{
                //3.
                self.jsonArray = JSON as? NSArray
                //4.
                for item in self.jsonArray! as! [NSDictionary]{
                    //5.
                    let name = item["name"] as? String
                     let apellido = item["surname"] as? String
                    // let telefono = item["telephone"] as? Int
                    // let cedula = item["schProspectIdentification"] as? Int
                    self.nombreArray.append((name)!)
                    self.nombreArray.append((apellido)!)
                   // self.nombreArray.append((telefono))
                    //self.nombreArray.append((cedula))
                    
                }
                //6.
                self.lista.reloadData()
            }
            
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}*/
