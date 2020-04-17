//
//  UIStoryboard+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    enum Name: String {
        case main
        
        public var description: String {
            return rawValue.capitalized
        }
    }
}
