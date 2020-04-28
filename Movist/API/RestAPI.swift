//
//  RestAPI.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 28.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import PromiseKit

public final class RestAPI {
    
    static let shared = RestAPI()
    
    func execute<R>(with url: URL) -> Promise<R> where R: Mappable {
        
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
