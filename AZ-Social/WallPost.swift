//
//  WallPost.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 29.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit

class WallPost:Entity
{
    private var data:[String:Any]?
    var sender:Person
    var body:String?
    var map:MapDirection?
    var pictureUrls:[String]?
    var pictureSizes:[CGSize]?
    var time:Date
    init(send:Person,time:Date) {
        sender = send
        self.time = time
    }
    
    
}


