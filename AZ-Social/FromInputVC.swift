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
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 4
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! PhotoInputVC).pgCont = pgCont
        (segue.destination as! PhotoInputVC).rigistrationData = rigistrationData

    }
    
}
