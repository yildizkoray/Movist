//
//  Cosmos+Settings.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Cosmos
import UIKit

fileprivate struct Constans {
    
    static let totalStars = 5
    static let starSize = 12.0
    static let emptyColor = UIColor(red: 158, green: 158, blue: 188)
    static let emptyBorderColor = UIColor(red: 158, green: 158, blue: 188)
    static let filledColer = UIColor(red: 238, green: 196, blue: 58)
    static let filledBorderColor = UIColor(red: 238, green: 196, blue: 58)
    static let filledImage = "filled-star".image
    static let emptyImage = "empty-star".image
}

public extension CosmosSettings {
    
    static let `default`: CosmosSettings = {
        var settings = CosmosSettings()
        settings.totalStars = Constans.totalStars
        settings.emptyColor = Constans.emptyColor
        settings.emptyBorderColor = Constans.emptyBorderColor
        settings.filledImage = Constans.filledImage
        settings.emptyImage = Constans.emptyImage
        settings.starSize = Constans.starSize
        settings.updateOnTouch = false
        return settings
    }()
}
