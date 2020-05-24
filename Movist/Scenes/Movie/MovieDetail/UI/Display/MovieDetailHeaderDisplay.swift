//
//  MovieDetailHeaderDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public struct MovieDetailHeaderDisplay {
    
    let backdrop: URL
    let display: MovieInfoDisplay
    
    public init(with movie: Movie) {
        backdrop = .backdrop(file: movie.backdrop.emptyIfNil)
        display = MovieInfoDisplay.init(with: movie)
    }
    
    private init() {
        backdrop = .randomIcon()
        display = .empty
    }
    
    static let empty = MovieDetailHeaderDisplay()
}

