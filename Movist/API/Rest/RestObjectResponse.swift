//
//  RestObjectResponse.swift
//  Movist
//
//  Created by Koray Yıldız on 8.05.2021.
//  Copyright © 2021 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public struct RestObjectResponse<T: BaseMappable>: RestResponse {
    
    public typealias Data = T
    
    public var data: Data?
    public var error: APIError?
    
    public init?(map: Map) {
        data = Mapper<T>().map(JSON: map.JSON)
        error = try? APIError(map: map)
    }
    
    public mutating func mapping(map: Map) {
        data <- map["results"]
    }
}
