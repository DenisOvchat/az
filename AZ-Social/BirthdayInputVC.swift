//
//  BirthdayInputVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 30.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit
class BirthdayInputVC:UIViewController
{
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    
    var pgCont:UIPageControl!
    var rigistrationData:[String:Any]!
    override func viewDidLoad() {
        picker.datePickerMode = .date
        picker.tintColor = UIColor.white
        picker.setValue(UIColor.white, forKeyPath: "textColor")
        maleButton.isHighlighted = true
        
        femaleButton.isHighlighted = true
    }
    override func viewWillAppear(_ animated: Bool) {
        pgCont.currentPage = 3
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rigistrationData["birth_day"] = picker.date.timeIntervalSince1970
        (segue.destination as! FromInputVC).pgCont = pgCont
        (segue.destination as! FromInputVC).rigistrationData = rigistrationData
        
    }
    
    @IBAction func changed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        
        dateLabel.text = formatter.string(from: picker.date)
    }
    
    
    @IBAction func maleBut(_ sender: Any) {
        maleButton.isHighlighted = false
        
        femaleButton.isHighlighted = true
        rigistrationData["gender"] = "Male"

    }
   
    @IBAction func femaleBut(_ sender: Any) {
        maleButton.isHighlighted = true
        femaleButton.isHighlighted = false
        rigistrationData["gender"] = "Female"
    }
    
}
