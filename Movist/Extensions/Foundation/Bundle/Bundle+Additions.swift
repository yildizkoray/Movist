//
//  Bundle+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension Bundle {
    
    func infoDictionaryValue<T>(for key: String) -> T {
        return object(forInfoDictionaryKey: key) as! T
    }
}
