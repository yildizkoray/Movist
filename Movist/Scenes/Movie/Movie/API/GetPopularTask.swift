//
//  MovieAPI.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 6.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import Alamofire

public struct GetPopularTask: APITask {
    
    public var method: HTTPMethod = .get
    public var path: String = "/movie/popular"
    public var queryParameters: [URLQueryItem]
    
    public init() {
        queryParameters = [
            URLQueryItem(name: "api_key", value: .TMDB_API_KEY)
        ]
    }
}
