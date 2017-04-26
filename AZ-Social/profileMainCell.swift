//
//  profileMainCell.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 11.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
class profileMainCell:UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate
{
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var isOnlineLabel: UILabel!
    
    @IBOutlet weak var oldcityLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var onMapTopConstraint: NSLayoutConstraint!
    
    var profile:FullProfile!
    
    func setcell(friend:FullProfile)
    {
        profile = friend
        topImageView.downloadedFrom(link: friend.topImageUrl!)
        avatarImage.downloadedFrom(link: friend.pictUrl)
        nameLabel.text = friend.name + " " + friend.secondName
        if friend.isOnline
        {
            isOnlineLabel.text = "Online"
            isOnlineLabel.textColor = UIColor(red: 0, green: 146, blue: 176, al: 1)
        }
        else
        {
            isOnlineLabel.text = "Offline"
            isOnlineLabel.textColor = UIColor(red: 155, green: 155, blue: 155, al: 1)
        }
        //oldcityLabel.text = friend.WhereFrom
        
        let now = Date()
        let birthday: Date = friend.BirhDay
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        oldcityLabel.text = age.description + friend.WhereFrom
        if (friend.isMine)
        {
            onMapTopConstraint.constant = 10
        }
        else
        {
            onMapTopConstraint.constant = 66
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        //collectionView.flow
        //collectionView.setsize
        //let layout = UICollectionViewFlowLayout()
        
        //layout.scrollDirection = .vertical
        //collectionView.lay
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! fiveFriendsCell
        cell.setcell(friend: profile.friends[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    
    
}
    
    
    
    

