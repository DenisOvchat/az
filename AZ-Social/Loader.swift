//
//  Loader.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 01.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
class Loader {
    private var array:[Entity]!
    var delegate:LoaderDelegate!
    private var name:String
    var queue:DispatchQueue?
    init(named:String) {
        name = named
    }
    func assignArray(array:[Entity])
    {
        self.array = array
    }
    func assignQueue(queue:DispatchQueue)
    {
        self.queue = queue
    }
    
    
}