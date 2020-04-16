//
//  Any+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public typealias Callback<T> = (_: T) -> Void
public typealias VoidCallback = () -> Void

public func emptyCallback<T>() -> Callback<T> {
  return { _ in }
}

public func voidCallback() -> VoidCallback {
  return { }
}

public extension Optional where Wrapped: Any {
    
    func ifNil(_ value: @autoclosure () -> Wrapped) -> Wrapped {
        switch self {
        case .none:
            return value()
        case .some(let value):
            return value
        }
    }
}
