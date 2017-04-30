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
    
    
    
    func GETRequestByAdding(postfix:String,complititionHandler: @escaping (Data?) -> Void)
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
    static func addServerManager(named:String,domain:String)
    {
        let manager = ServerManager()
        manager.serverDomain = domain
        ServerManager.instances[named] = manager
    }
    static func deliteServerManager(named:String)
    {
        ServerManager.instances[named] = nil
    }
    func getDomain()->String
    {
        return serverDomain
    }
    
    func POSTJSONRequestByAdding(postfix:String,data:[String:Any],complititionHandler: @escaping (Data?) -> Void)
    {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        
        let url = NSURL(string: serverDomain + postfix)
        let request = NSMutableURLRequest(url: url! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        do {
            let postData = try JSONSerialization.data(withJSONObject: data, options:JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = postData
            
            let postDataTask = session.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error:Error?) -> Void in
                
                if data != nil {
                        complititionHandler(data)
                }
            }
            postDataTask.resume()
            
        } catch { }
    }
}

