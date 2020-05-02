//
//  UIColor+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIColor {
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpa: CGFloat = 1) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255, alpha: alpa)
    }
}
