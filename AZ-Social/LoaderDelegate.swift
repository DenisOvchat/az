//
//  LoaderDelegate.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 01.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
protocol LoaderDelegate {
    func didLoadEntitiesToTheEnd(Amount:Int)
    
    func didLoadEntitiesToTheStart(Amount:Int)
    func didReloadEntities(indexes:[Int])
    func didDeleteEntities(indexes:[Int])
    func didAddEntities(indexes:[Int])
    
}
