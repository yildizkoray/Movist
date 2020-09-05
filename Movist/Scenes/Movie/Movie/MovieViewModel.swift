//
//  MovieViewModel.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 5.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation
import PromiseKit

public final class MovieViewModel: ViewModel {
    
    public var coordinator: MovieCoordinator!
    
    public func start() -> Promise<[MovieDisplay]>{
        return when(fulfilled: popular(), toprated(), upcoming()).compactMap {
            popular, toprated, upcoming in
            return [popular, toprated, upcoming]
        }
    }
    
    private func popular() -> Promise<MoviePopularDisplay> {
        let popular: Promise<Popular> = api.execute(with: GetPopularTask())
        return popular.map(MoviePopularDisplay.init)
    }
    
    private func toprated() -> Promise<MovieTopRatedDisplay> {
        let popular: Promise<TopRated> = api.execute(with: GetTopRatedTask())
        return popular.map(MovieTopRatedDisplay.init)
    }
    
    private func upcoming() -> Promise<MovieUpComingDisplay> {
        let popular: Promise<UpComing> = api.execute(with: GetUpComingTask())
        return popular.map(MovieUpComingDisplay.init)
    }
}
