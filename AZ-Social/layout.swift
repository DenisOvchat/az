//
//  layout.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 11.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit
class layout:UICollectionViewFlowLayout
{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.scrollDirection = .horizontal
        //sets
      //  self.collectionViewContentSize = CGSize(width: 74, height: 88)
    }
}
