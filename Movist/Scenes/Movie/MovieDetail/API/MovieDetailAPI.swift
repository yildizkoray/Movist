//
//  MovieDetailAPI.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire

public enum MovieDetailAPI: URLRequestConvertible {
    
    case detail(id: Int)
    
    public var baseURL: URL {
        return .TMDB_API_URL
    }
    
    public var method: HTTPMethod {
        
        switch self {
            
        case .detail:
            return .get
        }
    }
    
    public var path: String {
        
        switch self {
            
        case .detail(let id):
            return "/movie/\(id)"
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        let parameters: [String: String] = [
            "api_key": .TMDB_API_KEY
        ]
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        
        return request
    }
}

