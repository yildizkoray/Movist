//
//  APIResponse.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public protocol APIResponse: Mappable {
    
    var error: APIError? { get }
    var isFailure: Bool { get }
    var isSuccess: Bool { get }
}

public extension APIResponse {
    
    func throwErrorIfFailure() throws {
        if isFailure {
            throw error!
        }
    }
}
