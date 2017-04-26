//
//  Funcs.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 08.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit

class ProgramData
{
        //  var termsP:UnsafeMutablePointer < [String:[Term]] >
    // var alphabetP:UnsafeMutablePointer < [String] >
   // var publications=[Publication]()
    //var changes = [[[valChange]]]()
    //var MaxsAndMins = [[[String:CGFloat]]]()
    var settings=Settings()
    //var iap = IAP()
    var myProfile:FullProfile
    
    init()
    {
        myProfile = FullProfile(mine: true, name: "denis", secondName: "offchar", pictUrl: "http://i.ucrazy.ru/files/pics/2015.03/1427726601_anypics.ru-65214.jpg", isOnline: true, id: 0)
        myProfile.BirhDay = Date(timeIntervalSince1970: 100000)
        myProfile.WhereFrom = "Москва"
        myProfile.topImageUrl = "https://www.firestock.ru/wp-content/uploads/2015/11/Dollar-Photo-Club-Teal-Square-Background-700x393.jpg"
        //termsP = UnsafePointer < [String:[Term]] >(&terms)
        //alphabetP = UnsafePointer < [String] >(&alphabet)
    }
}
class Settings
{
    
}

class Ss
{
    let screenSize: CGRect = UIScreen.main.bounds
    
    static var X:CGFloat=1.0
    static var Y:CGFloat=1.0
    static var cellHeightMul:CGFloat=0.0
    static var Yy:CGFloat=0.0
    static var topBarHeights:CGFloat=0.0
    static var statusBar:CGFloat=0.0
    static var rowHeight:CGFloat=0.0
    static var defaultInset:CGFloat=0.0
    static var MenuInset:CGFloat=44
    static var BannerHeight:CGFloat=0.0
    
    // static var font:UIFont
    init()
    {
        let screenSize: CGRect = UIScreen.main.bounds
        
    }
    //static let newspictsize:CGSize=
}
class menus
{
    static let Settings1 = [["1"],["2","3","4","5"],["6"]]
    static let Privatnost = ["1","2","3","4","5","6","7","8","9","10","11"]
    //static let
}
func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range)}
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, al: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: al)
    }
    
    convenience init(netHex:Int, alpha:CGFloat=1.0) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, al: alpha)
    }
}
extension UILabel {
    func prepareAndResizeLabel( _ origin:CGPoint,vertically:Bool, knownDimension:CGFloat,text: String, theFont:UIFont) -> CGFloat
    {
        var constraintSize=CGSize()
        var frame=CGRect()
        var unknownDim:CGFloat!
        if(vertically)
        {
            constraintSize = CGSize(width: knownDimension, height: CGFloat.greatestFiniteMagnitude)
            frame=text.boundingRect(with: constraintSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: theFont], context: nil)
            unknownDim = frame.height
            
        }
        else
        {
            constraintSize = CGSize(width: CGFloat.greatestFiniteMagnitude,height: knownDimension)
            frame=text.boundingRect(with: constraintSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: theFont], context: nil)
            unknownDim = frame.width
            
        }
        self.lineBreakMode = .byWordWrapping
        self.frame=CGRect(origin: origin, size: frame.size)
        self.text=text
        self.numberOfLines=0
        
        self.font=theFont
        return unknownDim
        
    }
    func getSizeForLabel( knownDimension:CGFloat,text: String, theFont:UIFont) -> CGFloat
    {
        var constraintSize=CGSize()
        var frame=CGRect()
        var unknownDim:CGFloat!
        
        constraintSize = CGSize(width: knownDimension, height: CGFloat.greatestFiniteMagnitude)
        frame=text.boundingRect(with: constraintSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: theFont], context: nil)
        unknownDim = frame.height
        
        
        
        self.text=text
        
        return unknownDim
        
    }
    
}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
class dialogues
{
    var array = [dialogBody]()
    var dictionary = [Int:dialogBody]()

    func add(friend:dialogBody,forKey:Int)
    {
        array.append(friend)
        dictionary[forKey] = friend
    }
    func remove(forKey:Int)
    {
        array.remove(at: array.index{$0 === dictionary[forKey]}!)
        
        dictionary[forKey] = nil
    }
    
    
}