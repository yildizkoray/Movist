//
//  RestArrayResponse.swift
//  Movist
//
//  Created by Koray Yıldız on 7.05.2021.
//  Copyright © 2021 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public struct RestArrayResponse<T: BaseMappable>: RestResponse {
    
    public typealias Data = [T]
    
    public var data: Data?
    public var error: APIError?
    
    public init?(map: Map) {
        data = try? map.value("results")
        error = try? APIError(map: map)
    }
    
    public mutating func mapping(map: Map) {
        data <- map["results"]
    }
}
