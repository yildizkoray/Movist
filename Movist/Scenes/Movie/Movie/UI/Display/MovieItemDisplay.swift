//
//  MovieDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct MovieItemDisplay { // TODO: - Change `MovieItemDisplay` struct name
    
    let content: VisaulContent
    let id: Int
    let rating: Double
    
    private init() {
        content = .empty
        id = .zero
        rating = .zero
    }
    
    public init(movie: Movie) {
        self.content = VisaulContent(
            title: movie.title.ifNil(.empty),
            subtitle: movie.averageVote.ifNil(.zero).string,
            visual: .url(.poster(file: movie.posterImage.ifNil(.empty)))
        )
        self.id = movie.id.ifNil(.zero)
        self.rating = movie.averageVote.ifNil(.zero)
        
    }
    
    public static let empty = MovieItemDisplay()
}
