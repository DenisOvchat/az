//
//  loginVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 15.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
class LoginVC:UIViewController
{
    let data = (UIApplication.shared.delegate as! AppDelegate).data
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func loadView() {
        super.loadView()
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let loged:Bool=true
        
        ServerManager.shared(named: "main")?.GETRequestByAdding(postfix: "",
                                                                complititionHandler:
            {
                
                (data:Data?, response:URLResponse?, error:Error?) in
                                                                   
                if let httpRsponse = response as? HTTPURLResponse
                {
                    if httpRsponse.statusCode == 200
                    {
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let initialViewController = storyboard.instantiateViewController(withIdentifier: "TBC")
                        
                        self.appDelegate.window?.rootViewController = initialViewController
                        self.appDelegate.window?.makeKeyAndVisible()
                        
                        //self.appDelegate.data.myProfile = p
                        
                        print ("islogined 200")
                    }
                    if httpRsponse.statusCode == 401
                    {
                        print ("islogined 401")
                        
                    }
                }
                
                
        }, withCookies: true)
        

        if loged
        {
            
           // self.window = UIWindow(frame: UIScreen.main.bounds)
            
            
//            performSegue(withIdentifier: "toApp", sender: nil)

        }
        else
        {
            
        }
        
    }
    @IBAction func taped(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func logingAction(_ sender: Any) {
        
        
        let data = ["email":loginField.text,"password":passwordField.text]
        
        ServerManager.shared(named: "main")?.POSTJSONRequestByAdding(postfix: "/persons/sign_in", data: data, complititionHandler:  { (data:Data?, response:URLResponse?, error:Error?) in
            
            
            
            if let httpResponse = response as? HTTPURLResponse, let fields = httpResponse.allHeaderFields as? [String : String] {
                
                if httpResponse.statusCode == 202
                {
                    let url = NSURL(string: ServerManager.shared(named: "main")!.getDomain())
                    
                    
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url as! URL)
                    HTTPCookieStorage.shared.setCookies(cookies, for: url! as URL, mainDocumentURL: nil)
                    for cookie in cookies {
                        
                        
                        
                        var cookieProperties = [HTTPCookiePropertyKey: AnyObject]()
                        cookieProperties[HTTPCookiePropertyKey.name] = cookie.name as AnyObject?
                        cookieProperties[HTTPCookiePropertyKey.value] = cookie.value as AnyObject?
                        cookieProperties[HTTPCookiePropertyKey.domain] = cookie.domain as AnyObject?
                        cookieProperties[HTTPCookiePropertyKey.path] = cookie.path as AnyObject?
                        cookieProperties[HTTPCookiePropertyKey.version] = NSNumber(value: cookie.version)
                        cookieProperties[HTTPCookiePropertyKey.expires] = NSDate().addingTimeInterval(31536000)
                        
                        let newCookie = HTTPCookie(properties: cookieProperties )
                        HTTPCookieStorage.shared.setCookie(newCookie!)
                        
                        print("name: \(cookie.name) value: \(cookie.value)")
                    }
                }
                
             
            }
            
        })
        
    }
    
    
}
