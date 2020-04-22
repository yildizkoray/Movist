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
            af.setImage(withURL: url, placeholderImage: placeholderImage, imageTransition: .crossDissolve(0.25))
        }
        else {
            af.cancelImageRequest()
            image = placeholderImage
        }
    }
}
