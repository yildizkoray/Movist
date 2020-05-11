//
//  MovieDetailViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 11.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import PromiseKit

public final class MovieDetailViewModel {
    
    public var coordinator: MovieDetailCoordinator!
    
    let api: RestAPI = .shared
    
    let id: Int
    
    public init(id: Int) {
        self.id = id
    }
    
    public func start() -> Promise<Movie> {
        let movie: Promise<Movie> = RestAPI.shared.execute(with: MovieDetailAPI.movieDetail(id: id))
        return movie
    }
}
