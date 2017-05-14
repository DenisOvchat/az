//
//  TableViewCell.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 03.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos

protocol AttachmentsDelegate {
    func deleteAttachment(for indexPath: IndexPath)
    
}


class AddPostCell: UITableViewCell,UITextViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    


    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var attachmentsCollection: UICollectionView!
    
    @IBOutlet weak var attachmentsHeightConstraint: NSLayoutConstraint!
    var tableView:UITableView?
    
    var attachments = [Attachment]()
    
    let attachmentUpdatesQueue = DispatchQueue(label: "lab", qos: .utility)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        textView.delegate = self
        attachmentsCollection.delegate = self
        attachmentsCollection.dataSource = self
        attachmentsCollection.register(UINib(nibName: "AttachmentCellCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "attachmentCell")
        //register(AttachmentCellCollectionViewCell.self, forCellWithReuseIdentifier: "attachmentCell")
        //register(UINib(nibName: "AttachmentCellCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "attachmentCell")
        //textView.contentHorizontalAlignment = .fill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 
    func textViewDidChange(_ textView: UITextView) {
        guard tableView != nil else
        {
            return
        }
        let currentOffset = tableView?.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView?.beginUpdates()
        tableView?.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView?.setContentOffset(currentOffset!, animated: false)
    }
    @IBAction func addAttachmentsPushed(_ sender: Any) {
        let alertView = UIAlertController(title: "attach", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        let addPhotoAction = UIAlertAction(title: "Фото", style: UIAlertActionStyle.default) { (UIAlertAction) in
            guard self.tableView != nil else
            {
                return
            }
            let photosSelectVC = BSImagePickerViewController()
            (self.tableView?.delegate as! UIViewController).bs_presentImagePickerController(photosSelectVC, animated: true,
                                            select: { (asset: PHAsset) -> Void in
                                                // User selected an asset.
                                                // Do something with it, start upload perhaps?
            }, deselect: { (asset: PHAsset) -> Void in
                // User deselected an assets.
                // Do something, cancel upload?
            }, cancel: { (assets: [PHAsset]) -> Void in
                // User cancelled. And this where the assets currently selected.
            }, finish: { (assets: [PHAsset]) -> Void in
                
                let phManager = PHImageManager()
                DispatchQueue.main.async { 
                    var indexPaths = [IndexPath]()
                    
                    for asset in assets
                    {
                        
                        let attachment = PhotoAttachmentFromDevice(with: asset)
                        self.attachments.append(attachment)
                        
                        
                        
                    }
                    
                    for i in 0..<assets.count
                    {
                        indexPaths.append(IndexPath(row: self.attachmentsCollection.numberOfItems(inSection: 0) + i , section: 0))
                       
                    }
                    
                   
                        

                    self.attachmentsCollection.insertItems(at: indexPaths )
                

                }
                
                
                // User finished with these assets
            }, completion: nil)

        }
        let addCoordinatesAction = UIAlertAction(title: "местоположение", style: UIAlertActionStyle.default) { (UIAlertAction) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) { (UIAlertAction) in
            
        }
        alertView.addAction(addPhotoAction)
        alertView.addAction(addCoordinatesAction)
        alertView.addAction(cancelAction)
        (self.tableView?.delegate as! UIViewController).present(alertView, animated: true, completion: nil)

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
     func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return attachments.count
    }
    
    //3
     func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = attachmentsCollection.dequeueReusableCell(withReuseIdentifier: "attachmentCell",for: indexPath) as! AttachmentCellCollectionViewCell
        
        cell.backgroundColor = UIColor.black
        cell.attachment = attachments[indexPath.row]
        cell.tag = indexPath.row
        // Configure the cell
        return cell
    }
    /*func deleteAttachment(for indexPath: IndexPath) {
        DispatchQueue.global().async {
            self.attachments.remove(at: indexPath.row)
            
            self.attachmentsCollection.deleteItems(at: [indexPath])
        }
        
        
    }*/
    
    @IBAction func deleteAttachment(_ sender: AttachmentCellCollectionViewCell) {
        attachmentUpdatesQueue.async {
            self.attachments.remove(at: sender.tag)
            
            self.attachmentsCollection.deleteItems(at: [IndexPath(row: sender.tag, section: 0)])
        }
        
    }
    
}

