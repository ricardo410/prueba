//
//  MainNavigationController.swift
//  Servicios
//
//  Created by william ricardo  on 16/02/18.
//  Copyright © 2018 william ricardo . All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        
        if  siEstaLogeado() {
            
            let homeController = ListaViewController()
            viewControllers = [homeController]
            
            
        } else{
            perform(#selector(showLoginViewcontroller), with: nil, afterDelay: 0.01)
        
        }
}
    
    fileprivate func siEstaLogeado() -> Bool{
        return true
    }
        
    @objc func showLoginViewcontroller() {
            
            let loginController = LoginViewController()
            present(loginController, animated: true, completion:{
            
            })
        }
}

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
    }
    
}

