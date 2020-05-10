//
//  MovieHeaderDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 10.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct MovieHeaderDisplay {
    
    public let title: String
    public let type: MovieType
    
    static let empty = MovieHeaderDisplay(title: .empty, type: .popular)
}
