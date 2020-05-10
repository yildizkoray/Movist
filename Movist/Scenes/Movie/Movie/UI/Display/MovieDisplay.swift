//
//  MoviePopularDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public enum MovieType {
    case popular
    case toprated
    case upcoming
}

public protocol MovieDisplay {
    
    var movies: [MovieItemDisplay] { get }
    var title: String { get }
    var type: MovieType { get }
}

// MARK: - MoviePopularDisplay

public struct MoviePopularDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var title: String = "Popular"
    public var type: MovieType = .popular
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MoviePopularDisplay()
}

// MARK: - MovieUpComingDisplay

public struct MovieUpComingDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var title: String = "UpComing"
    public var type: MovieType = .upcoming
    
    public init(items: UpComing) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MovieUpComingDisplay()
}

// MARK: - MovieTopRatedDisplay

public struct MovieTopRatedDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var title: String = "TopRated"
    public var type: MovieType = .toprated
    
    public init(items: TopRated) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MovieTopRatedDisplay()
}
