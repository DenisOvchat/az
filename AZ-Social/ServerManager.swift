//
//  ServerManager.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 29.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation




class ServerManager
{
    
    private var serverDomain:String = "2323123123123"
    
    private static var instances=[String:ServerManager]()
    
    
    
    func GETRequestByAddingSubpath(postfix:String,complititionHandler: @escaping (Data?) -> Void)
    {
        let urlString = serverDomain + postfix
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                
                print(error)
            } else {
                
                complititionHandler(data)
                
            }
            
            }.resume()
    }
    func sharedInstance(named:String)->ServerManager?
    {
        return ServerManager.instances[named]
    }
    func addServerManager(named:String,domain:String)
    {
        let manager = ServerManager()
        manager.serverDomain = domain
        ServerManager.instances[named] = manager
    }
    func deliteServerManager(named:String)
    {
        ServerManager.instances[named] = nil
    }
    func getDomain()->String
    {
        return serverDomain
    }
    
}

