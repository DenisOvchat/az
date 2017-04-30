//
//  PhotoInputVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 30.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit
class PhotoInputVC:UIViewController
{
    var pgCont:UIPageControl!
    var rigistrationData:[String:Any]!
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 5
    }
    
    
}
