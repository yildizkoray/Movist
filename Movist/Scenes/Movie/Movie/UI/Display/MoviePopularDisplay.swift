//
//  MoviePopularDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public enum Type {
    case popular
    case toprated
    case upcoming
}

public protocol MovieDisplay {
    
    var movies: [MovieItemDisplay] { get set }
    var title: String { get set }
    var type: Type { get set }
}

public struct MoviePopularDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var title: String = "Popular"
    public var type: Type = .popular
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MoviePopularDisplay()
}

public struct MovieUpComingDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var title: String = "UpComing"
    public var type: Type = .upcoming
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MovieUpComingDisplay()
}

public struct MovieTopRatedDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var title: String = "TopRated"
    public var type: Type = .toprated
    
    public init(items: Popular) {
        movies = items.movies.map(MovieItemDisplay.init)
    }
    
    private init() {
        movies = .empty()
    }
    
    public static let empty = MovieTopRatedDisplay()
}
