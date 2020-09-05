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

public final class RestAPI {
    
    public static let shared = RestAPI()
    
    func execute<R>(with url: URL) -> Promise<R> where R: ImmutableMappable {
        
        return Promise<R> { seal in
            
            AF.request(url).responseObject { (response: AFDataResponse<R>) in
                
                switch response.result {
                case .success(let data):
                    seal.fulfill(data)
                    
                case .failure(let error):
                    seal.reject(error)
                    
                }
            }
        }
    }
    
    func execute<R>(with task: APITask) -> Promise<R> where R: ImmutableMappable {

        let operation = try! request(task: task)

        return Promise<R> { seal in

            operation.responseObject { (response: AFDataResponse<R>) in

                switch response.result {
                case .success(let data):
                    seal.fulfill(data)

                case .failure(let error):
                    seal.reject(error)

                }
            }
        }
    }
    
    func readJSONFile<R>(from filename: String) -> Promise<R> where R: ImmutableMappable {
        let url = Bundle.main.url(forResource: filename, withExtension: "json")!
        
        return Promise<R> { seal in
            
            AF.request(url).responseObject { (response: AFDataResponse<R>) in
                
                switch response.result {
                case .success(let data):
                    seal.fulfill(data)
                    
                case .failure(let error):
                    seal.reject(error)
                    
                }
            }
        }
    }
}

// MARK: - Alamofire.DataRequest

fileprivate extension RestAPI {
    
    func request(task: APITask) throws -> DataRequest {
        return try AF.request(
            task.asURL(),
            method: task.method,
            parameters: task.body,
            encoding: task.encoding,
            headers: HTTPHeaders(task.headers)).validate()
    }
}
