//
//  EntityStorage.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 29.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
protocol EntityStorageDelegate {
    func load()
    
    
}





/*class classicTableDataSourceAndDelegate:UITableViewDataSource
{
    
    init(tableView:UITableView,entitiesStorage:EntitiesStorage)
    {
        
    }
}
*/



class EntitiesStorage
{
    private var entitiesDictionary = [Int:Entity]()
    private var entitiesArray = [Entity]()
    
    var isLoadingNewElements:Bool = false
    
    var delegate:EntityStorageDelegate?
    
    
    var count:Int
    {
        get
        {
            return entitiesArray.count
        }
    }
    
    
    
    
    func loadMore(count:Int)
    {
        
    }
    
    func SwapElements()
    {
        
    }
    
    subscript(index: Int) -> Entity
    {
        get {
            return entitiesArray[index]
        }
     
    }
    
    func elementBy(id:Int)->Entity?
    {
        return entitiesDictionary[id]
    }
    
    func add(element:Entity,by id:Int)
    {
        //entitiesArray.append(element)
        //entitiesDictionary.
    }
    
    
    
    
}
