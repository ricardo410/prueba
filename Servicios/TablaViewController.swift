//
//  TablaViewController.swift
//  Servicios
//
//  Created by william ricardo  on 12/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit
import Alamofire

class TablaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    var jsonArray: NSArray?
    var nombreArray: Array <String> = []
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return self.nombreArray.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewcell", for: indexPath) as! TableViewCell
        
        cell.nombre.text = self.nombreArray[indexPath.row]
        
        
        
        return cell
    }
    

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
        // Do any additional setup after loading the view.
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
                    self.nombreArray.append((name)!)
                    
                }
                //6.
                self.tableView.reloadData()
            }
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
