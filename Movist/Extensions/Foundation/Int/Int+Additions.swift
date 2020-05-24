//
//  Int+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension Int {
    
    var isZero: Bool {
        return self == .zero
    }
    
    var string: String {
        return String(self)
    }
    
    var runtime: String {
        let hour = self / 60
        let min = self % 60
        return String(format: "%02d:%02d", hour, min)
    }
}
