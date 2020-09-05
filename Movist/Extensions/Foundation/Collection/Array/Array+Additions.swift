//
//  Array+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension Array {
    
    static func empty() -> Array {
        return []
    }
    
    mutating func append<E>(contensOf newElements: E?) where E: Sequence, Element == E.Element {
        
        if let newElements = newElements {
            append(contensOf: newElements)
        }
    }
}

public extension Array where Element == AppendToResponse {
    
    var queryValue: String {
        return map { $0.rawValue }.joined(separator: .comma)
    }
}
