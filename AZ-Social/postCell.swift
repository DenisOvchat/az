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
class postCell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,TRMosaicLayoutDelegate
{
    
    @IBOutlet weak var avat: AvatarImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var bodyContentView: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    func setcell(post:WallPost)
    {
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
            
            
        }
        else
        {
            if post.map != nil
            {
                
            }
        }
        
        
      //  89662788169
        
        
        
        
        
        
        
        let mosaicLayout = TRMosaicLayout()
        collectionView.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
    
        
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
      //  cell.setcell(friend: profile.friends[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
        // I recommend setting every third cell as .Big to get the best layout
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
    
    
    
}


