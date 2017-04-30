//
//  NameInputVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 30.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit
class NameInputVC:UIViewController
{
    
    var pgCont:UIPageControl!
    var rigistrationData:[String:Any]!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var secondNameField: UITextField!
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 2
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rigistrationData["first_name"] = firstNameField.text
        rigistrationData["last_name"] = firstNameField.text

        (segue.destination as! BirthdayInputVC).pgCont = pgCont
        (segue.destination as! BirthdayInputVC).rigistrationData = rigistrationData

    }
    
}
