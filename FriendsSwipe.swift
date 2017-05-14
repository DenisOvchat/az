//
//  FriendsSwipe.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 29.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
import SwipeViewController

class Controller: SwipeViewController {
    
   
    override func viewDidLoad() {
        //self.navigationBar.frame = CGRect(x: 0, y: 0, width: navigationBar.frame.width , height: 88)
        super.viewDidLoad()
        let stb = UIStoryboard(name: "Main", bundle: nil)
        
        let screenSize: CGRect = UIScreen.main.bounds

        
        let page_one = stb.instantiateViewController(withIdentifier: "fr1")
        let page_two = stb.instantiateViewController(withIdentifier: "fr2")
        page_one.title = "Все"
        page_two.title = "online"
        
        setViewControllerArray([page_one, page_two])
        setFirstViewController(0)
        equalSpaces = true
        UIColor(red: 195, green: 195, blue: 195, al: 1)
        UIColor(red: 0, green: 148, blue: 176, al: 1)
        
       // setButtons(UIFont.systemFont(ofSize: 14), color: UIColor(red: 195, green: 195, blue: 195, al: 1)
//)
        setButtonsOffset(-60, bottomOffset: 0)
        setButtonsWithSelectedColor(UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium), color:         UIColor(red: 195, green: 195, blue: 195, al: 1)
            , selectedColor:         UIColor(red: 0, green: 148, blue: 176, al: 1))
        
        

        setSelectionBar(screenSize.width / 2 - 30, height: 3, color:  UIColor(red: 0, green: 148, blue: 176, al: 1)
)
        
        


    }
   
    
    
    
    
    
    
}

