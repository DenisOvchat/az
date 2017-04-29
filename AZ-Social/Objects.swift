//
//  Objects.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 08.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit

class Friend
{
    var id:Int
    var name:String
    var secondName:String
    var pictUrl:String
    var isOnline:Bool
    
  /*  var image:UIImage
    {
        get
        {
            return
        }
    }*/
    init(name:String,secondName:String,pictUrl:String,isOnline:Bool,id:Int) {
        self.name = name
        self.pictUrl = pictUrl
        self.isOnline = isOnline
        self.secondName = secondName
        self.id = id
    }
}

class MapDirection
{
    
}
class FullProfile:Friend
{
    var BirhDay:Date!
    var WhereFrom:String!
    var School:String?
    var University:String?
    var Job:String?
    var Phone:String?
    var Mail:String?
    var type:String?
    var isMine:Bool
    var topImageUrl:String?
    var Posts=[WallPost]()
    var friends=[Friend]()
    init(mine:Bool,name:String,secondName:String,pictUrl:String,isOnline:Bool,id:Int)
    {
        isMine = mine
        super.init(name: name, secondName: secondName, pictUrl: pictUrl, isOnline: isOnline, id: id)
        
    }
    
}


class Chat
{
    var messages=[Message]()
    var newMessagesCount = 0
    var roomView:DialogVC?
}
class dialogBody:Friend
{
    var chat = Chat()
    
    override init(name:String,secondName:String,pictUrl:String,isOnline:Bool,id:Int) {
        super.init(name: name, secondName: secondName, pictUrl: pictUrl, isOnline: isOnline, id: id)
        self.name = name
        self.pictUrl = pictUrl
        self.isOnline = isOnline
        self.secondName = secondName
        self.id = id
    }
}


class Message
{
    var sender:Friend
    var isMine:Bool
    var text:String
    var picturesURLs:[String]?
    var isRed:Bool = false
    var time:String
    var isServerMessage = false
    init(sender:Friend,isMine:Bool,text:String,isRead:Bool,time:String) {
        self.sender = sender
        self.isMine = isMine
        self.text = text
        isRed = isRead
        self.time = time
    }
}
