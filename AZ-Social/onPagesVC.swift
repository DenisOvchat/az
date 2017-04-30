//
//  onPagesVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 15.03.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
class RegistrationData
{
    var mail:String?
    var code:String?
    var password:String!
    var type:String!
    var firstName:String!
    var secondName:String!
    var birthday:Int!
    var gender:String!
    var avat:Data?
    var backGround:Data?
    var phone:String?
    
}

class OnPagesVC:UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var field: UITextField!
    let data = (UIApplication.shared.delegate as! AppDelegate).data
    var pgCont:UIPageControl!
    let regex = ""
    override func loadView() {
        super.loadView()
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pgCont = UIPageControl(frame: CGRect(origin: CGPoint(x: (navigationController?.navigationBar.frame.width)!/2, y: (navigationController?.navigationBar.frame.height)!/2), size: CGSize.zero))
        
        field.keyboardType = .decimalPad
        field.delegate =  self
        pgCont.numberOfPages = 6
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        
        navigationController?.navigationBar.addSubview(pgCont)
        let im = UIImageView(frame:  (navigationController?.view.frame)!)
        im.image = UIImage(named: "ФонРегистрации.png")!
        navigationController?.view.insertSubview(im, at: 0)
        
         //navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 0, green: 0, blue: 60, alpha: 0)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 0

        
        /* let loged:Bool=false
        if loged
        {
            let pgs = storyboard?.instantiateViewController(withIdentifier: "PageController")
            addChildViewController(pgs!)
            //view.addSubview((pgs?.view)!)
            view.insertSubview((pgs?.view)!, at: 0)
            didMove(toParentViewController: self)
        }
        else
        {
            performSegue(withIdentifier: "login", sender: nil)
            
            
        }
     */   
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if (textField == field)
        {
            var rng=range
           /* if string == "" && Int((textField.text! as NSString).character(at: range.location)) == nil && range.location > 0
            {
                rng = NSMakeRange(range.location - 1, range.length)
            }*/
            let newString = (textField.text! as NSString).replacingCharacters(in: rng, with: string)
            let components = newString.components(separatedBy: (NSCharacterSet.decimalDigits.inverted))
          //  componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
            {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - rng.length as Int
                
                
                return (newLength > 10) ? false : true
            }
            if((length==10))
            {
                field.resignFirstResponder()
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne
            {
                formattedString.append("1 ")
                index += 1
            }
            if (length - index) > 3
            {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@)", areaCode)
                index += 3
            }
            if length - index > 3
            {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            
                if length - index > 2
                {
                    let prefix = decimalString.substring(with: NSMakeRange(index, 2))
                    formattedString.appendFormat("%@-", prefix)
                    index += 2
                }
            }
            
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            textField.text = formattedString as String
            return false
        }
        else
        {
            return true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! PhoneCodeInputVC).pgCont = pgCont
        
       // segue.destination.modalTransitionStyle = .partialCurl
    }
    
    
}

class PhoneCodeInputVC:UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var field: UITextField!
    var pgCont:UIPageControl!
    override func viewDidLoad() {
        field.keyboardType = .decimalPad
        field.delegate =  self
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 1
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if (textField == field)
        {
            var rng=range
            /* if string == "" && Int((textField.text! as NSString).character(at: range.location)) == nil && range.location > 0
             {
             rng = NSMakeRange(range.location - 1, range.length)
             }*/
            let newString = (textField.text! as NSString).replacingCharacters(in: rng, with: string)
            let components = newString.components(separatedBy: (NSCharacterSet.decimalDigits.inverted))
            //  componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
            
            if length == 0 || (length > 4 && !hasLeadingOne) || length > 5
            {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - rng.length as Int
                
                
                return (newLength > 4) ? false : true
            }
            if((length==10))
            {
                field.resignFirstResponder()
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne
            {
                formattedString.append("1 ")
                index += 1
            }
            
            if length - index > 1
            {
                let prefix = decimalString.substring(with: NSMakeRange(index, 1))
                formattedString.appendFormat("%@-", prefix)
                index += 1
                
                if length - index > 1
                {
                    let prefix = decimalString.substring(with: NSMakeRange(index, 1))
                    formattedString.appendFormat("%@-", prefix)
                    index += 1
                    if length - index > 1
                    {
                        let prefix = decimalString.substring(with: NSMakeRange(index, 1))
                        formattedString.appendFormat("%@-", prefix)
                        index += 1
                        
                    }
                }
            }
            
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            textField.text = formattedString as String
            return false
        }
        else
        {
            return true
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! NameInputVC).pgCont = pgCont
    }
    
}

class NameInputVC:UIViewController
{
    @IBOutlet weak var field: UITextField!

    var pgCont:UIPageControl!
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 2
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! BirthdayInputVC).pgCont = pgCont
    }
    
}
class BirthdayInputVC:UIViewController
{
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var picker: UIDatePicker!
    var pgCont:UIPageControl!
    
    override func viewDidLoad() {
        picker.datePickerMode = .date
        picker.tintColor = UIColor.white
        picker.setValue(UIColor.white, forKeyPath: "textColor")

    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 3
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! FromInputVC).pgCont = pgCont
    }

    @IBAction func changed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        
        dateLabel.text = formatter.string(from: picker.date)
    }
    
    
}

class FromInputVC:UIViewController
{
    var pgCont:UIPageControl!
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 4
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! PhotoInputVC).pgCont = pgCont
    }
    
}

class PhotoInputVC:UIViewController
{
    var pgCont:UIPageControl!
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 5
    }
   
    
}
