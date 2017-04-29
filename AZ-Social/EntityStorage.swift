//
//  EntityStorage.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 29.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
protocol EntityProtocol {
    func load( )
    
}





class classicTableDataSourceAndDelegate:UITableViewDataSource
{
    
    init(tableView:UITableView,entitiesStorage:EntitiesStorage)
    {
        
    }
}




class EntitiesStorage
{
    var entitiesDictionary = [Int:Entity]()
    var entitiesArray = [Entity]()
    
    var count:Int
        {
        get{
            
        }
    }
    
    
    func load()
    {
        
    }
    
    func loadMore(count:Int)
    {
        
    }
    
    func SwapElements()
    {
        
    }
    
    
    
    
    
    
    
}
