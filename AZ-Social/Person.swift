//
//  Person.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 28.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

class Person
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
