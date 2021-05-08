//
//  ViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 20.06.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public class ViewModel {
    
    public var service: RestService
    
    public init(_ service: RestService = RestService(backend: RestAPI(with: RestAPIMiddleware(allowsRetry: true)))) {
        self.service = service
    }
}
