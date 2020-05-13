//
//  MovieDetailViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import PromiseKit

public class MovieDetailViewModel {
    
    public var coordinator: MovieDetailCoordinator!
    
    public var id: Int
    
    public init(with id: Int) {
        self.id = id
    }
    
    public func start() -> Promise<Movie> {
        let movie: Promise<Movie> = RestAPI.shared.execute(with: MovieDetailAPI.detail(id: id))
        return movie
    }
}
