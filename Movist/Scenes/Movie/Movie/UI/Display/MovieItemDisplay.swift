//
//  MovieDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct MovieItemDisplay { // TODO: - Change `MovieItemDisplay` struct name
    
    let content: VisualContent
    let id: Int
    let rateStarDisplay: RateStarDisplay
    
    private init() {
        content = .empty
        id = .zero
        rateStarDisplay = .empty
    }
    
    public init(movie: Movie) {
        self.content = VisualContent(
            title: movie.title.ifNil(.empty),
            subtitle: movie.averageVote.ifNil(.zero).string,
            visual: movie.poster.poster().visual
        )
        self.id = movie.id.ifNil(.zero)
        self.rateStarDisplay = RateStarDisplay(rate: movie.averageVote.ifNil(.zero), settings: .default)
    }
    
    public static let empty = MovieItemDisplay()
}
