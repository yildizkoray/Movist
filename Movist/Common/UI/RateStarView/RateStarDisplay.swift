//
//  RateStarDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import Cosmos

public struct RateStarDisplay {
    
    let rate: String
    let settings: CosmosSettings
    
    public init(rate: String, settings: CosmosSettings = .default) {
        self.rate = rate
        self.settings = settings
    }
    
    private init() {
        rate = .empty
        settings = .default
    }
    
    static let empty = RateStarDisplay()
}
