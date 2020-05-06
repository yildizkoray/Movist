//
//  MovieAPI.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 6.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire

public enum MovieAPI: URLRequestConvertible {
    
    case popular, upcoming, toprated
    
    public var baseURL: URL {
        return .TMDB_API_URL
    }
    
    public var method: HTTPMethod {
        
        switch self {
            
        case .popular, .upcoming, .toprated:
            return .get
        }
    }
    
    public var path: String {
        
        switch self {
            
        case .popular:
            return "/movie/popular"
            
        case .upcoming:
            return "movie/upcoming"
            
        case .toprated:
            return "movie/top_rated"
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        let parameters: [String: String] = ["api_key": .TMDB_API_KEY]
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        
        return request
    }
    
}
