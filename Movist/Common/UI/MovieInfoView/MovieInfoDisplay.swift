//
//  MovieInfoDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public struct MovieInfoDisplay {
    
    let content: VisaulContent
    let rateStarDisplay: RateStarDisplay
    let language: String
    let overview: String
    
    public init(with movie: Movie) {
        content = VisaulContent(
            title: movie.title.emptyIfNil,
            subtitle: movie.overview.emptyIfNil,
            visual: .url(.poster(file: movie.posterImage.emptyIfNil))
        )
        
        rateStarDisplay = RateStarDisplay(rate: movie.averageVote.ifNil(.zero))
        language = "Language: \(movie.originalLanguage.emptyIfNil)"
        overview = movie.overview.emptyIfNil
    }
    
    private init() {
        content = .empty
        rateStarDisplay = .empty
        language = .empty
        overview = .empty
    }
    
    public static let empty = MovieInfoDisplay()
}
