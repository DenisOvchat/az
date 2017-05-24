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
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func loadView() {
        super.loadView()
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let loged:Bool=false
        if loged
        {
            performSegue(withIdentifier: "toApp", sender: nil)

        }
        else
        {
            
        }
        
    }
    
    @IBAction func logingAction(_ sender: Any) {
        
        
        let data = ["email":loginField.text,"password":passwordField.text]
        
        ServerManager.shared(named: "main")?.POSTJSONRequestByAdding(postfix: "/persons/sign_in", data: data, complititionHandler:  { (data:Data?, response:URLResponse?, error:Error?) in
            
            
            if let httpResponse = response as? HTTPURLResponse, let fields = httpResponse.allHeaderFields as? [String : String] {
                
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
            
        })
        
    }
    
    
}
