//
//  LoaderDelegate.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 01.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
@objc protocol LoaderDelegate {
    @objc optional func didLoadEntitiesToTheEnd(Amount:Int)
    
    @objc optional func didLoadEntitiesToTheStart(Amount:Int)
    @objc optional func didReloadEntities(indexes:[Int])
    @objc optional func didDeleteEntities(indexes:[Int])
    @objc optional func didAddEntities(indexes:[Int])
    
}
