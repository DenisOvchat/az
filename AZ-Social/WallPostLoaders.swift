//
//  WallPostServerLoader.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 01.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation

class WallPostLoaderFromServer:Loader
{
    var serverManager:ServerManager!
    init(named:String,with serverManager:ServerManager,qos:DispatchQoS,id:Int? = nil) {
        super.init(named: named,qos:qos)
        self.serverManager = serverManager
    }
    
    func load(count:Int)
    {
        
    }
    func loadMoreToTheEnd(count:Int)
    {
        delegate?.didLoadEntitiesToTheEnd!(Amount: count)
    }
    
}



class WallPostLoaderFromDatabase:Loader
{
    func loadMore(count:Int) {
        
    }
}

