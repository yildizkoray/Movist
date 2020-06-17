//
//  MovieDetailViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import PromiseKit

private struct Constants {
    static let appendToResponse: [String] = [
        "casts,similar"
    ]
}

public class MovieDetailViewModel {
    
    public var coordinator: MovieDetailCoordinator!
    
    public var id: Int
    
    public init(with id: Int) {
        self.id = id
    }
    
    public func start() -> Promise<MovieDetailDisplay> {
        let movie: Promise<Movie> =
            RestAPI.shared.execute(with: GetMovieDetailTask(id: id, appendToResponse: Constants.appendToResponse))
        return movie.map(MovieDetailDisplay.init)
    }
}
