//
//  RestResponse.swift
//  Movist
//
//  Created by Koray Yıldız on 7.05.2021.
//  Copyright © 2021 Koray Yildiz. All rights reserved.
//

import Foundation

public protocol RestResponse: APIResponse {
    
    associatedtype Data
    var data: Data? { get }
}


public extension RestResponse {
    
    var isFailure: Bool {
        return !isSuccess
    }
    
    var isSuccess: Bool {
        return error == nil
    }
}
