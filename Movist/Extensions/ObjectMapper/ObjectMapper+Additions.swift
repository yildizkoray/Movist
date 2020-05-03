//
//  ObjectMapper+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public extension ObjectMapper.Map {
    
    func value<T>(_ key: String, default: T.Object, using transform: T) throws -> T.Object where T: TransformType {
        if let value: T.Object = try? self.value(key, using: transform) {
            return value
        }
        else {
            return `default`
        }
    }
    
    func value<T>(_ key: String, default: T) throws -> T {
        if let value: T = try? self.value(key) {
            return value
        }
        else {
            return `default`
        }
    }
}
