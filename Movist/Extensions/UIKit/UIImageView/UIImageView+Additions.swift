//
//  UIImageView+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
    var hidableImage: UIImage? {
        get { return image }
        set {
            image = newValue
            isHidden = (newValue == nil)
        }
    }
    
    func set_kf_image(_ url: URL?, placeholder: UIImage? = nil) {
        
        if let url = url {
            let resource = ImageResource(downloadURL: url)
            kf.setImage(with: resource, placeholder: placeholder, options: [.transition(.fade(0.25))])
        }
        else {
            kf.cancelDownloadTask()
            image = placeholder
        }
    }
    
    func setVisual(_ visual: VisualContent.Visual?, placeholder: UIImage? = nil) {
        
        if let visual = visual {
            switch visual {
            case .static(let image):
                self.image = image
                
            case .url(let url):
                set_kf_image(url, placeholder: placeholder)
            }
        }
    }
}
