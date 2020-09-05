//
//  Bool+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == Bool {
    
    var falseIfNil: Wrapped {
        return ifNil(false)
    }
}
