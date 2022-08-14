//
//  RestAPIMiddleware.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire
import Foundation

public final class RestAPIMiddleware: RequestInterceptor {
    
    private let allowsRetry: Bool
    private let locale: Locale = .autoupdatingCurrent
    private let timeZone: TimeZone = .autoupdatingCurrent
    
    public init(allowsRetry: Bool) {
        self.allowsRetry = allowsRetry
    }
    
    public func adapt(_ urlRequest: URLRequest,
                      for session: Session,
                      completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var urlRequest = urlRequest
        urlRequest.setValue("IOS", forHTTPHeaderField: "Client-Type")
        
        if let timeZone = timeZone.localizedName(for: .standard, locale: locale) {
            urlRequest.setValue(timeZone, forHTTPHeaderField: "Time-Zone")
        }
        
        completion(.success(urlRequest))
    }
}

public extension RestAPIMiddleware {
    
    private static let retryable = RestAPIMiddleware(allowsRetry: true)
    private static let unretryable = RestAPIMiddleware(allowsRetry: false)
    
    static func shared(allowsRetry: Bool) -> RestAPIMiddleware {
        if allowsRetry {
            return .retryable
        }
        return .unretryable
    }
}
