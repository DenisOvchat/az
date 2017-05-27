//
//  Person.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 28.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//
import UIKit
class Person
{
    var dictionary = NSDictionary()

    
    var id:Int!
    var name:String!
    {
        get
        {
            if let nm = dictionary["first_name"] as! String
            {
                return nm as! String
            }
            
        }
        
    }
    var secondName:String!
    {
        get
        {
            if let nm = dictionary["last_name"]
            {
                return nm as! String
            }
            
        }
        
    }
    var pictUrl:String!
    {
        get
        {
            if let nm = dictionary["avatar"]
            {
                return nm as! String
            }
            
        }
        
    }
    var isOnline:Bool
        {
        get
        {
            if let timeString = dictionary["last_login"]
            {
                
                let date = (timeString as! String).dateFromISO8601
                
                
                return Date().timeIntervalSince(date) > 3000
            }
            
        }
        
    }
    
    /*  var image:UIImage
     {
     get
     {
     return
     }
     }*/
    init(name:String,secondName:String,pictUrl:String,isOnline:Bool,id:Int) {
       /* self.name = name
        self.pictUrl = pictUrl
        self.isOnline = isOnline
        self.secondName = secondName
        self.id = id*/
    }
    init(with dictionary:NSDictionary)
    {
        
        self.dictionary = dictionary
    }

}
