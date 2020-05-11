//
//  MovieViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 5.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import PromiseKit

public final class MovieViewModel {
    
    let api: RestAPI
    
    public var coordinator: MovieCoordinator!
    
    public init(with api: RestAPI = .shared) {
        self.api = api
    }
    
    public func start() -> Promise<[MovieDisplay]>{
        return when(fulfilled: popular(), toprated(), upcoming()).compactMap {
            popular, toprated, upcoming in
            return [popular, toprated, upcoming]
        }
    }
    
    private func popular() -> Promise<MoviePopularDisplay> {
        let popular: Promise<Popular> = RestAPI.shared.execute(with: MovieAPI.popular)
        return popular.map(MoviePopularDisplay.init)
    }
    
    private func toprated() -> Promise<MovieTopRatedDisplay> {
        let popular: Promise<TopRated> = RestAPI.shared.execute(with: MovieAPI.toprated)
        return popular.map(MovieTopRatedDisplay.init)
    }
    
    private func upcoming() -> Promise<MovieUpComingDisplay> {
        let popular: Promise<UpComing> = RestAPI.shared.execute(with: MovieAPI.upcoming)
        return popular.map(MovieUpComingDisplay.init)
    }
}
