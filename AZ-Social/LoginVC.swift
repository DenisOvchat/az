//
//  loginVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 15.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
class LoginVC:UIViewController
{
    let data = (UIApplication.shared.delegate as! AppDelegate).data
    
    override func loadView() {
        super.loadView()
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let loged:Bool=false
        if loged
        {
            performSegue(withIdentifier: "toApp", sender: nil)

        }
        else
        {
            
        }
        
    }
    
    
    
}
