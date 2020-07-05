//
//  UIImageView+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import AlamofireImage

public extension UIImageView {
    
    var hidableImage: UIImage? {
        get { return image }
        set {
            image = newValue
            isHidden = (newValue == nil)
        }
    }
    
    func set_af_image(url: URL?, placeholderImage: UIImage? = nil) {
        
        if let url = url {
            af_setImage(
                withURL: url,
                placeholderImage: placeholderImage,
                imageTransition: .crossDissolve(0.25))
        }
        else {
            af_cancelImageRequest()
            image = placeholderImage
        }
    }
    
    func setVisual(_ visual: VisaulContent.Visual?, placeholderImage: UIImage? = nil) {
        
        if let visual = visual {
            switch visual {
            case .static(let image):
                self.image = image
                
            case .url(let url):
                set_af_image(url: url, placeholderImage: placeholderImage)
            }
        }
    }
}
