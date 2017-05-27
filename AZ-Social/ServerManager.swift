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
    
    
    
    func GETRequestByAdding(postfix:String,complititionHandler: ((Data?,URLResponse? ,Error? ) -> Void)?,withCookies:Bool = true)
    {
        
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
            
            
            let url = NSURL(string: serverDomain + postfix)
            
            let request = NSMutableURLRequest(url: url! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60)
            
            if withCookies
            {
                let cookieJar = HTTPCookieStorage.shared
                let d = cookieJar.cookies(for:         URL(string: "http://188.225.38.189")!
                )
                //for cookie in d!{
                    let cookie = d?[0]
                    
                    request.addValue((cookie?.value)!, forHTTPHeaderField: "X-CSRFToken")
              //  }
                
                
                
                
                
            }
            
            request.httpMethod = "GET"
            
            do {
                let postDataTask = session.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error:Error?) -> Void in
                    
                    
                    print("___________________")
                    print("RECV:")
                    if (response != nil)
                    {
                        print (response)
                        
                    }
                    if (data != nil)
                    {
                        print("WITHDATA:")
                        print(print (NSString(data: data!, encoding: String.Encoding.utf8.rawValue)))
                        
                    }
                    
                    print("++++++++++++++++++++")
                    
                    if  complititionHandler != nil {
                        complititionHandler!(data,response,error)
                        
                    }
                    
                }
                print("___________________\n")
                print("SEND:")
                print(request.url)
                print(request.allHTTPHeaderFields)
                
                //print (NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue))
                postDataTask.resume()
                
            } catch { }
        
    }
    static func shared(named:String)->ServerManager?
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
    
    func POSTJSONRequestByAdding(postfix:String,data:[String:Any],complititionHandler: ((Data?,URLResponse? ,Error? ) -> Void)?,withCookies:Bool = true)
    {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        
        
        let url = NSURL(string: serverDomain + postfix)
        
        let request = NSMutableURLRequest(url: url! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60)
        
        if withCookies
        {
            let cookieJar = HTTPCookieStorage.shared
            let d = cookieJar.cookies(for: URL(string: "http://188.225.38.189")!
            )
            for cookie in d!{
                
                // if cookie.name == "MYNAME" {
                
                let cookieValue = cookie.value
                print("COOKIE name = \(cookie.commentURL)")
                
                print("COOKIE name = \(cookie.name)")
                
                print("COOKIE VALUE = \(cookieValue)")
                // }
                request.addValue(cookie.name + " = " + cookie.value, forHTTPHeaderField: "Cookie")
            }
            
            
            
            
            
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
       
        do {
            let postData = try JSONSerialization.data(withJSONObject: data, options:JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = postData
            
            let postDataTask = session.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error:Error?) -> Void in
                

                print("___________________")
                print("RECV:")
                if (response != nil)
                {
                    print (response)

                }
                if (data != nil)
                {
                    print("WITHDATA:")
                    print(print (NSString(data: data!, encoding: String.Encoding.utf8.rawValue)))
                    
                }
                
                print("++++++++++++++++++++")
                
                if  complititionHandler != nil {
                    complititionHandler!(data,response,error)

                }
                
            }
            print("___________________\n")
            print("SEND:")
            print(request.url)
            print(request.allHTTPHeaderFields)
            
            print (NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue))
            postDataTask.resume()
            
        } catch { }
    }
}

