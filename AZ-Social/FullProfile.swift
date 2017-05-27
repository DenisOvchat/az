//
//  FullProfile.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 24.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
class FullProfile:Person
{
    
    
    var postsStorage = WallPostStorage()

    var BirhDay:Date!
    var WhereFrom:String!
    var School:String?
    var University:String?
    var Job:String?
    var Phone:String?
    var Mail:String?
    var type:String?
    var isMine:Bool = true
    var topImageUrl:String?
    var Posts=[WallPost]()
    var friends=[Person]()
    init(mine:Bool,name:String,secondName:String,pictUrl:String,isOnline:Bool,id:Int)
    {
        isMine = mine
        super.init(name: name, secondName: secondName, pictUrl: pictUrl, isOnline: isOnline, id: id)
        
    }
   /* override init(with dictionary:NSDictionary)
    {
        super.init(with: dictionary)
    }*/
    
}
