//
//  TBC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 29.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import  UIKit
class TBC:UITabBarController
{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let navigationController = Controller(rootViewController: pageController)
        //view.backgroundColor = UIColor.red
        navigationController.setTitle(txt:"Друзья")
        navigationController.tabBarItem.image = UIImage(named: "invalidName-1")
        navigationController.tabBarItem.title = "Друзья"
        viewControllers?.append(navigationController)
        
        
        
        
    }
    
}
