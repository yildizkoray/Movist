//
//  MovieDetailAPI.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire

struct GetMovieDetailTask: APITask {
    
    public var method: HTTPMethod = .get
    public var path: String
    public var queryParameters: [URLQueryItem]
    
    public init(id: Int) {
        path = "/3/movie/\(id)"
        queryParameters = [
            URLQueryItem(name: "api_key", value: .TMDB_API_KEY),
            URLQueryItem(name: "append_to_response", value: "casts")
        ]
    }
}

