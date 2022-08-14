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
    var header: MovieHeaderDisplay { get }
}

// MARK: - MoviePopularDisplay

public struct MoviePopularDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var header: MovieHeaderDisplay
    
    public init(items: [Movie]) {
        movies = items.map(MovieItemDisplay.init)
        header = MovieHeaderDisplay(title: "Popular", type: .popular)
    }
    
    private init() {
        movies = .empty()
        header = .empty
    }
    
    public static let empty = MoviePopularDisplay()
}

// MARK: - MovieUpComingDisplay

public struct MovieUpComingDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var header: MovieHeaderDisplay
    
    public init(items: [Movie]) {
        movies = items.map(MovieItemDisplay.init)
        header = MovieHeaderDisplay(title: "UpComing", type: .upcoming)
    }
    
    private init() {
        movies = .empty()
        header = .empty
    }
    
    public static let empty = MovieUpComingDisplay()
}

// MARK: - MovieTopRatedDisplay

public struct MovieTopRatedDisplay: MovieDisplay {
    
    public var movies: [MovieItemDisplay]
    public var header: MovieHeaderDisplay = .empty
    
    public init(items: [Movie]) {
        movies = items.map(MovieItemDisplay.init)
        header = MovieHeaderDisplay(title: "TopRated", type: .toprated)
    }
    
    private init() {
        movies = .empty()
        header = .empty
    }
    
    public static let empty = MovieTopRatedDisplay()
}
