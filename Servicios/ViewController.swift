//
//  ViewController.swift
//  Servicios
//
//  Created by william ricardo  on 8/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import  SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    var token = ""
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Almacenamiento del coreData
        /*let appDelegate = UIApplication.shared.delegate as! AppDelegate
         
         let context = appDelegate.persistentContainer.viewContext
         
         let nuevoUsuario = NSEntityDescription.insertNewObject(forEntityName: "Login", into: context)
         
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "login")
         
         request.predicate = NSPredicate(format: "email = %@", "ricardo@gmail.com")
         request.predicate = NSPredicate(format: "password = %@", "directo123")
         request.returnsObjectsAsFaults = false
         do {
         let result = try context.fetch(request)
         for data in result as! [NSManagedObject] {
         print(data.value(forKey: "email") as! String)
         print(data.value(forKey: "password") as! String)
         }
         
         } catch {
         
         print("Failed")
         }
         let url: String = ("http://directotesting.igapps.co/application/login/\(email)/\(password)")
         let params: Parameters = ["email":"email","password":"password"]
         let credential = URLCredential(user: self.email.text!, password: self.password.text!,persistence: .forSession)
         Alamofire.request(url, method: .get, parameters: params,  encoding: URLEncoding.default).responseJSON { response in
         print("Request: \(String(describing: response.request))")   // solicitud original de la url
         print("Response: \(String(describing: response.response))") // http url respuesta
         print("Result: \(response.result)")                         //respuesta de la realizacion
         
         if let json = response.result.value {
         print("JSON: \(json)") // respuesta json serializada
         }
         
         if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
         print("Data: \(utf8Text)")
         }
         }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func ingresar(_ sender: Any){
        
        
        if email?.text != "" && password.text != "" {
            
            /////////////Guardar correo y contraseña\\\\\\\\\\\\\\\\
            ///let nuevoUsuario = NSEntityDescription.insertNewObject(forEntityName: "Login", into: context)
            // nuevoUsuario.setValue(self.email!.text, forKey: "email")
            //nuevoUsuario.setValue(self.password!.text, forKey: "password")
            
            ///////////Peticion alamofire\\\\\\\\\\\\\\\\\
            let delegado = UIApplication.shared.delegate as! AppDelegate
            let email = "email"
            let password = "password"
            //let url: String = ("http://directotesting.igapps.co/application/login")
            let url = delegado.url
            let params: Parameters = ["email":self.email.text!,"password":self.password.text!]
            //let headers = [
            //  "Authorization": "Basic ZGlyZWN0b0BkaXJlY3RvLmNvbTpkaXJlY3RvMTIz"]
            
            
            Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default).authenticate(user: email, password:password).responseJSON { response in
                
                print("Request: \(String(describing: response.request))")   // solicitud original de la url
                print("Response: \(String(describing: response.response))") // http url respuesta
                print("Result: \(response.result)")                         //respuesta de la realizacion
                
                if let json = response.result.value {
                    print("JSON: \(json)") // respuesta json serializada
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)")
                    print (self.email.text!)
                    print(self.password.text!)
                    print (self.token)
                    
                    ////////////////Guardar token?\\\\\\\\\\\\\\\\\
                    //// condicion correo y contrseña invalidos\\\\\\\\\\\\
                    if response.response?.statusCode == 133 &&      response.response?.statusCode == 134  {
                        
                        let alerta = UIAlertController(title: "Error", message: "Correo o  contraseña no registrados ", preferredStyle: .alert)
                        
                        let accion = UIAlertAction(title: "Cerrar", style: .cancel, handler: nil)
                        alerta.addAction(accion)
                        
                        self.present(alerta,animated: true,completion: nil)
                        
                        //////// correo y la contraseña validos\\\\\\\\\\\\\
                    } else if  response.response?.statusCode == 200{
                        ////Guardar datos\\\\\
                        //let Defaults = UserDefaults.standard
                        let defaut = delegado.Defaults
                        defaut.set(self.email.text!, forKey: "email")
                        defaut.set(self.password.text!, forKey: "password")
                        defaut.synchronize()
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        UserDefaults.standard.synchronize()
                        let json = JSON(response.value)
                        delegado.Token = delegado.Token + json["authToken"].string!
                        print(delegado.Token)
                        
                        //let name = defaults.string(forKey: "email")!
                        // print("Mostrar: \(name)")
                        //print ("Mostrar: \(contraseña)")
                        
                        
                        self.performSegue(withIdentifier: "Tabla", sender: self)
                        
                        
                        
                    }
                }
            }
            
            
            do{
                try context.save()
                print("Guardado")
            }
            catch{
                print(error.localizedDescription)
                
            }
            
        } else {
            ////// Condicion de que debe ingresar algo. alerta\\\\\\\\\\\\\\\\\
            self.email.text = ""  ; self.password.text = ""
            
            let alerta = UIAlertController(title: "Error", message: "Por favor Ingresa un correo y contraseña", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "Cerrar", style: .cancel, handler: nil)
            alerta.addAction(accion)
            
            
            
            self.present(alerta,animated: true,completion: nil)
        }
    }
    
    
    @IBAction func autoLogin(_ sender: UISwitch) {
        
        
        
    }
    
    
}
