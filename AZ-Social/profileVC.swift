//
//  profileVC.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 05.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
class profileVC:UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var settingsBut: UIBarButtonItem!

    @IBOutlet weak var tableView: UITableView!
    
    var profile:FullProfile!
    var data = (UIApplication.shared.delegate as! AppDelegate).data
    var fiveFriends = [Friend]()
    
    
    
    override func loadView() {
       super.loadView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        profile = data.myProfile
        
        for i in 0...10
        {
            let fr = Friend(name: "Стиви\(i)", secondName: "Джобс", pictUrl: "https://st.kp.yandex.net/images/actor_iphone/iphone360_93826.jpg", isOnline: true, id: i)
            profile.friends.append(fr)
            fiveFriends.append(fr)
            for j in 0...25
            {
                if j % 2 == 0
                {
                    
                    //fr.chat.messages.append( Message(sender: fr, isMine: false, text: "привет \(i) fdg\(j) dfg dfgdfg dsfg dfg sdfg sdfg sdfg sdfgsd fgs dfgsdf sfgd", isRead : true,time: "11:41"))
                }
                else
                {
                    //  fr.chat.messages.append( Message(sender: data.myProfile, isMine: true, text: "привет \(i)", isRead : true,time: "11:40"))
                }
                
            }
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "main") as! profileMainCell
            cell.setcell(friend: profile)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newpost")
            return UITableViewCell()
            
        default: return UITableViewCell()
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            
            return 529
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "newpost")
            return 44
            
        default: return 44
            
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + (profile?.Posts.count)!
    }
    
    
    
}
