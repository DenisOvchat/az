//
//  FromInputVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 30.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit
class FromInputVC:UIViewController
{
    var rigistrationData:[String:Any]!
    
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rigistrationData["country"] = countryField.text
        rigistrationData["city"] = cityField.text
        
        ServerManager.shared(named: "main")?.POSTJSONRequestByAdding(postfix: "/persons/sign_up", data: rigistrationData, complititionHandler: nil)

        
        (segue.destination as! PhotoInputVC).rigistrationData = rigistrationData
        
    }
    
}
