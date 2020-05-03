//
//  MovieDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct MovieItemDisplay {
    
    let content: VisaulContent
    let rating: Double
    
    private init() {
        content = .empty
        rating = .zero
    }
    
    public init(movie: Movie) {
        let image: URL = URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterImage.ifNil(.empty))")!
        self.content = VisaulContent(
            title: movie.title.ifNil(.empty),
            subtitle: movie.averageVote.ifNil(.zero).string,
            visual: .url(image)
        )
        
        self.rating = movie.averageVote.ifNil(.zero)
    }
    
    public static let empty = MovieItemDisplay()
}
