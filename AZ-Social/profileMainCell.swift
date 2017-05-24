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
    override func awakeFromNib() {
        selectionStyle = .none

    }
    
    var profile:FullProfile!
    {
        didSet{
            //profile = friend
            topImageView.downloadedFrom(link: profile.topImageUrl!, contentMode: .scaleAspectFill)
            topImageView.downloadedFrom(link: profile.topImageUrl!)
            avatarImage.downloadedFrom(link: profile.pictUrl)
            avatarImage.layer.cornerRadius = 60
            avatarImage.layer.masksToBounds = true
            avatarImage.layer.borderWidth = 2
            avatarImage.layer.borderColor = UIColor.white.cgColor


            nameLabel.text = profile.name + " " + profile.secondName
            if profile.isOnline
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
            let birthday: Date = profile.BirhDay
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
            let age = ageComponents.year!
            oldcityLabel.text = age.description + profile.WhereFrom
            if (profile.isMine)
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
        }
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
    
    
    
    

