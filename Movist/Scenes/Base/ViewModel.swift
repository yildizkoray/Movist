//
//  ViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 20.06.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public class ViewModel {
    
    public var api: RestAPI
    
    public init(_ api: RestAPI = .shared) {
        self.api = api
    }
}
