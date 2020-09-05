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
    
    func setFont(family: Font.Family = .bahijTheSansArabic,
              weight: Font.Weight = .semilight,
              style: Font.Style = .regular,
              color: UIColor) {
        font = .font(family: family, weight: weight, style: style)
        textColor = color
    }
}


