//
//  MovieDetailViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import PromiseKit

private struct Constants {
    static let appendToResponse: [AppendToResponse] = [
        .cast, .review, .video, .similar
    ]
}

public class MovieDetailViewModel: ViewModel {
    
    public enum CellType: Int {
        case cast = 0
        case similar = 1
    }
    
    public var coordinator: MovieDetailCoordinator!
    
    public var id: Int
    
    public init(with id: Int) {
        self.id = id
    }
    
    public func start() -> Promise<MovieDetailDisplay> {
        let movie: Promise<Movie> = api.execute(with: GetMovieDetailTask(id: id, appendToResponse: Constants.appendToResponse))
        return movie.map(MovieDetailDisplay.init)
    }
    
    public func cellType(for indexPath: IndexPath) -> CellType {
        return indexPath.row.cellType
    }
}

private extension Int {
    
    var cellType: MovieDetailViewModel.CellType {
        if let type = MovieDetailViewModel.CellType(rawValue: self) {
            return type
        }
        else {
            return .cast
        }
    }
}
