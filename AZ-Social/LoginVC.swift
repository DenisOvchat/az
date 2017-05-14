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
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
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
    
    @IBAction func logingAction(_ sender: Any) {
        
        
        let data = ["email":loginField.text,"password":passwordField.text]
        
        ServerManager.shared(named: "main")?.POSTJSONRequestByAdding(postfix: "/persons/sign_in", data: data, complititionHandler: nil)

        
    }
    
    
}
