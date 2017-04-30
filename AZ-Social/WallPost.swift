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
    var sender:Friend
    var body:String?
    var map:MapDirection?
    var pictureUrls:[String]?
    var pictureSizes:[CGSize]?
    var time:Date
    init(send:Friend,time:Date) {
        sender = send
        self.time = time
    }
    
    
}


