//
//  RestAPI.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 28.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import PromiseKit

public final class RestAPI: API {
    
    public typealias Executable = DataRequest
    public typealias Operation = APITask
    
    private let connector: Session
    
    private lazy var acceptableStatusCodes: [Int] = {
        var statusCodes: [Int] =  .empty()
        statusCodes.append(contentsOf: 200...299)
        statusCodes.append(contentsOf: 400...499)
        return statusCodes
    }()
    
    public init(with connector: RestAPIMiddleware = .shared(allowsRetry: true)) {
        self.connector = Session(additionalHTTPHeaders: HTTPHeaders(), interceptor: connector)
    }
    
    public func execute(task: APITask) throws -> DataRequest {
        return try connector.request(
            task.asURL(),
            method: task.method,
            parameters: task.body,
            encoding: task.encoding,
            headers: HTTPHeaders(task.headers)
        ).validate(statusCode: acceptableStatusCodes)
    }
}
