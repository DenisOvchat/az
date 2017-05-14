//
//  PhotoAttachment.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 04.05.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import Photos

class PhotoAttachmentFromDevice:Attachment
{
    var phAsset :PHAsset
    private let phManager = PHImageManager()

    override func set(imageView: UIImageView) {
        self.phManager.requestImageData(for: self.phAsset, options: nil, resultHandler: { (data:Data?, str:String?, orientation:UIImageOrientation, arg:[AnyHashable : Any]?) -> Void in
            print(data)
            
           
            
            if data != nil{
                
                
                
                DispatchQueue.main.async {
                    
                    
                    
                    
                    
                    imageView.image = UIImage(data: data!)!
                    
                }
            }
            
            
            
        })

        
        
    }
    
    init(with asset:PHAsset) {
        phAsset = asset

        super.init()
        //super.image = image
    }
}
