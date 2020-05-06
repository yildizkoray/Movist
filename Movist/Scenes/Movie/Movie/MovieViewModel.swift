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
    
    public init(with api: RestAPI = .shared) {
        self.api = api
    }
    
    public func start() -> Promise<[MoviePopularDisplay]>{
        return when(fulfilled: popular(), toprated(), upcoming()).compactMap {
            popular, toprated, upcoming in
            return [popular, toprated, upcoming]
        }
    }
    
    private func popular() -> Promise<MoviePopularDisplay> {
        let popular: Promise<Popular> = RestAPI.shared.execute(with: MovieAPI.popular)
        return popular.map(MoviePopularDisplay.init)
    }
    
    private func toprated() -> Promise<MoviePopularDisplay> {
        let popular: Promise<Popular> = RestAPI.shared.execute(with: MovieAPI.toprated)
        return popular.map(MoviePopularDisplay.init)
    }
    
    private func upcoming() -> Promise<MoviePopularDisplay> {
        let popular: Promise<Popular> = RestAPI.shared.execute(with: MovieAPI.upcoming)
        return popular.map(MoviePopularDisplay.init)
    }
}
