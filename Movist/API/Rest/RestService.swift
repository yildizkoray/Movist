//
//  RestService.swift
//  Movist
//
//  Created by Koray Yıldız on 12.12.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire
import PromiseKit
import ObjectMapper
import Foundation

public final class RestService: Service {
    
    public typealias Backend = RestAPI
    
    public var cancelsPreviousOperations: Bool
    
    private(set) public var backend: RestAPI
    private var operations: [String: DataRequest]
    
    public init(backend: RestAPI) {
        self.backend = backend
        self.operations = [String: DataRequest]()
        self.cancelsPreviousOperations = true
    }
    
    public func execute<R>(task: APITask) -> Promise<R> where R: APIResponse {
        return
            firstly {
                [unowned self] () -> Guarantee<AFDataResponse<R>> in
                let operation = try backend.execute(task: task)
                return operation.responseObject()
            }
            .then { response -> Promise<R> in
                try response.value?.throwErrorIfFailure()
                
                return Promise { resolver in
                    resolver.resolve(response.value, response.error)
                }
            }
    }
    
    public func cancelAll() {
        operations.cancelAll()
    }
    
    deinit { cancelAll() }
}

public extension Dictionary where Value == DataRequest {
    
    mutating func cancelAll() {
        values.forEach { $0.cancel() }
        removeAll(keepingCapacity: false)
    }
}



public extension Alamofire.DataRequest {
    
    func responseObject<T: BaseMappable>(
        queue: DispatchQueue = .main,
        keyPath: String? = nil,
        mapToObject object: T? = nil,
        context: MapContext? = nil) -> Guarantee<AFDataResponse<T>>
    {
        return Guarantee { resolver in
            responseObject(queue: queue, keyPath: keyPath, mapToObject: object, context: context) {
                resolver($0)
            }
        }
    }
    
    func responseArray<T: BaseMappable>(
        queue: DispatchQueue = .main,
        keyPath: String? = nil,
        context: MapContext? = nil) -> Guarantee<AFDataResponse<[T]>>
    {
        return Guarantee { resolver in
            responseArray(queue: queue, keyPath: keyPath, context: context) {
                resolver($0)
            }
        }
    }
}
