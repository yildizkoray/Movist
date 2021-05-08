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
        let popular: Promise<RestArrayResponse<Movie>> = service.execute(task: GetPopularTask())
        return popular.compactMap { $0.data }.map(MoviePopularDisplay.init)
    }
    
    private func toprated() -> Promise<MovieTopRatedDisplay> {
        let popular: Promise<RestArrayResponse<Movie>> = service.execute(task: GetTopRatedTask())
        return popular.compactMap { $0.data }.map(MovieTopRatedDisplay.init)
    }
    
    private func upcoming() -> Promise<MovieUpComingDisplay> {
        let popular: Promise<RestArrayResponse<Movie>> = service.execute(task: GetUpComingTask())
        return popular.compactMap { $0.data }.map(MovieUpComingDisplay.init)
    }
}
