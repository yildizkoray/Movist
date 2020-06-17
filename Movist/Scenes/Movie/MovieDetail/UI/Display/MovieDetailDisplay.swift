//
//  MovieDetailDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public struct MovieDetailDisplay {
    
    let title: String
    let header: MovieDetailHeaderDisplay
    let casts: [CastDisplay]
    let similars: [MovieItemDisplay]
    
    public init(with movie: Movie) {
        title = movie.title.emptyIfNil
        header = MovieDetailHeaderDisplay.init(with: movie)
        casts = movie.cast.ifNil(.empty()).filter { $0.poster.emptyIfNil.isNotEmpty }.map(CastDisplay.init)
        similars = movie.similars.ifNil(.empty()).map(MovieItemDisplay.init)
    }
    
    private init() {
        title = .empty
        header = .empty
        casts = .empty()
        similars = .empty()
    }
    
    public static let empty = MovieDetailDisplay()
}
