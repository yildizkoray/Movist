//
//  Session+Additions.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire
import Foundation

public extension Alamofire.Session {
    
    convenience init(additionalHTTPHeaders: HTTPHeaders, interceptor: RequestInterceptor?) {
        
        var defaultHTTPHeaders = HTTPHeaders.default
        additionalHTTPHeaders.forEach {
            defaultHTTPHeaders.update($0)
        }
        
        let configuration = URLSessionConfiguration.af.default
        
        configuration.headers = defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 45
        configuration.timeoutIntervalForResource = 90
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        
        self.init(configuration: configuration, interceptor: interceptor)
    }
}
