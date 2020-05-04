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
    
    public func popular() -> Promise<MoviePopularDisplay> {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2526d77d81bb50e7ae223a8f13db2a2f")! // TODO: - Remove this URL
        let popular: Promise<Popular> = RestAPI.shared.execute(with: url)
        return popular.map(MoviePopularDisplay.init)
    }
}
