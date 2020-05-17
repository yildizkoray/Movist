//
//  APITask.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 14.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire

public protocol APITask {
    
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    
    var body: Parameters? { get }
    
    var path: String { get }
    var queryParameters: [URLQueryItem] { get }
    
    var encoding: ParameterEncoding { get }
}

extension APITask {
    
    public var encoding: ParameterEncoding {
        switch method {
        case .post, .put:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }

    public var headers: [String: String] {
        return .empty
    }

    public var queryParameters: [URLQueryItem] {
        return .empty()
    }
    
    public var body: Parameters? {
        return nil
    }
    
    public func asURL() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.host = .TMDB_API_URL
        urlComponents.scheme = .API_URL_SCHEME
        urlComponents.path = "/3\(path)"
        urlComponents.queryItems = queryParameters
        return try urlComponents.asURL()
    }
}

// MARK: - TMDB_API

public extension String {
    
    static let TMDB_API_KEY = ConfigReader.shared["TMDB_API_KEY"]
    static let TMDB_API_URL = ConfigReader.shared["TMDB_API_URL"]
    static let API_URL_SCHEME = ConfigReader.shared["API_URL_SCHEME"]
}

