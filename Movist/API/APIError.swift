//
//  APIError.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import ObjectMapper

public struct APIError: Error, ImmutableMappable {
    
    public let code: Int
    public let description: String
    
    public init(map: Map) throws {
        code = try map.value("status_code")
        description = try map.value("status_message")
    }
}
