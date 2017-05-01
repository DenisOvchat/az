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
    var pgCont:UIPageControl!
    var rigistrationData:[String:Any]!
    
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 4
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rigistrationData["county"] = countryField.text
        rigistrationData["city"] = cityField.text

        (segue.destination as! PhotoInputVC).pgCont = pgCont
        (segue.destination as! PhotoInputVC).rigistrationData = rigistrationData

    }
    
}
