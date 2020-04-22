//
//  UILabel+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UILabel {
    
    var hidableText: String? {
        get { return text }
        set {
            text = newValue
            isHidden = newValue.emptyIfNil.isEmpty
        }
    }
}


