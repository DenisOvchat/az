//
//  postCell.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 12.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import TRMosaicLayout

import UIKit
class postCell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource
{
    
    @IBOutlet weak var avat: AvatarImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var bodyContentView: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var collectionSizes=[CGSize]()
    
    override func awakeFromNib() {


        selectionStyle = .none
        
        
    }
    var post:WallPost!
    {
        didSet{
            avat.imageView.downloadedFrom(link: post.sender.pictUrl)
            avat.setting(isonline: post.sender.isOnline, radius: 20)
            nameLabel.text = post.sender.name + " " + post.sender.secondName
            
            let postTime = post.time
            let now = Date()
            let dif = now.timeIntervalSince(postTime)
            
            var formatter = DateFormatter()
            if dif > 172800
            {
                formatter.dateFormat = "dd MM YYYY HH:mm"
                timeLabel.text = formatter.string(from: postTime)
            }
            else
            {
                if dif > 86400
                {
                    formatter.dateFormat = "вчера HH:mm"
                    timeLabel.text = formatter.string(from: postTime)
                }
                else
                {
                    if dif > 3600
                    {
                        formatter.dateFormat = "сегодня HH:mm"
                        timeLabel.text = formatter.string(from: postTime)
                    }
                    else
                    {
                        if dif > 60
                        {
                            timeLabel.text = Int(dif/60).description + "минут назад"
                        }
                        else
                        {
                            timeLabel.text = "только что"
                        }
                    }
                }
            }
            
            bodyLabel.text = post.body
            
            if post.pictureUrls != nil
            {
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.reloadData()
                
            }
            else
            {
                if post.map != nil
                {
                    
                }
            }
            
            
            let width = UIScreen.main.bounds.width
            
            if  (post.pictureSizes?[0].IsHorizontal())!
            {
                collectionSizes.append(CGSize(width: width - 10 , height:  (post.pictureSizes?[0].height(for: width))!))
            }
            else
            {
                
            }
            
            
            
            
            
            
            
            
            //collectionView.flow
            //collectionView.setsize
            //let layout = UICollectionViewFlowLayout()
            
            //layout.scrollDirection = .vertical
            //collectionView.lay
        }
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! fiveFriendsCell
      //  cell.setcell(friend: profile.friends[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.pictureUrls!.count
    }
    /*
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let width = UIScreen.main.bounds.width
        let size = post.pictureSizes?[indexPath.row]
        
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    */
    
    
    
    
}


