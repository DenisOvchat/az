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
    init(serverManager:ServerManager) {
        super.init(array: array, delegate: delegate)
        self.serverManager = serverManager
    }
    
    func loadMoreToTheStart(count:Int)
    {
        
    }
    func loadMoreToTheEnd(count:Int)
    {
        
        
        
        delegate?.didLoadEntitiesToTheEnd(Amount: count)
    }
}
class WallPostLoaderFromDatabase:Loader
{
    func loadMore(count:Int) {
        
    }
}
class WallPostLoaderFromGeor:Loader
{
    func loadMore(count:Int) {
        
    }
}
