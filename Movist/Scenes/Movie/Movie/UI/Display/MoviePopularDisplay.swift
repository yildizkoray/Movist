//
//  MoviePopularDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public struct MoviePopularDisplay {
    
    let movies: [MovieItemDisplay]
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MoviePopularDisplay()
}

public struct MovieUpComingDisplay {
    
    let movies: [MovieItemDisplay]
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MovieUpComingDisplay()
}

public struct MovieTopDisplay {
    
    let movies: [MovieItemDisplay]
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MovieTopDisplay()
}
