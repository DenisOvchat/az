//
//  imageLoader.swift
//  AZ-Social
//
//  Created by  Denis Ovchar on 28.04.17.
//  Copyright © 2017  Denis Ovchar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

extension CGSize
{
    func IsHorizontal()->Bool
    {
        return width > height
    }
    
    func height(for width: CGFloat)->CGFloat
    {
        return height * width/self.width
    }
    func width(for height: CGFloat)->CGFloat
    {
        return width * height/self.height
    }
}
