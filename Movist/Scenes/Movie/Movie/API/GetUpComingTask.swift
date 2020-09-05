//
//  GetUpComingTask.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 14.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import Alamofire

public struct GetUpComingTask: APITask {
    
    public var method: HTTPMethod = .get
    public var path: String = "/movie/upcoming"
    public var queryParameters: [URLQueryItem]
    
    public init() {
        queryParameters = [
            URLQueryItem(name: "api_key", value: .TMDB_API_KEY)
        ]
    }
}
