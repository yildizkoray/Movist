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
    
    public init(with movie: Movie) {
        title = movie.title.emptyIfNil
        header = MovieDetailHeaderDisplay.init(with: movie)
    }
    
    private init() {
        title = .empty
        header = .empty
    }
    
    public static let empty = MovieDetailDisplay()
}
