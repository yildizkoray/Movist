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
    let genre: String
    let language: String
    let runtime: String
    let overview: String
    
    public init(with movie: Movie) {
        content = VisaulContent(
            title: movie.title.emptyIfNil,
            subtitle: movie.overview.emptyIfNil,
            visual: movie.poster.poster().visual
        )
        
        rateStarDisplay = RateStarDisplay(rate: movie.averageVote.ifNil(.zero))
        
        var genres: [String] = .empty()
        movie.genres.ifNil(.empty()).forEach {
            genres.append( $0.name.emptyIfNil)
        }
        genre = genres.joined(separator: .bullet)
        
        language = "Language: \(movie.originalLanguage.emptyIfNil)"
        runtime = movie.runtime.ifNil(.zero).runtime
        overview = movie.overview.emptyIfNil
    }
    
    private init() {
        content = .empty
        rateStarDisplay = .empty
        genre = .empty
        language = .empty
        overview = .empty
        runtime = .empty
    }
    
    public static let empty = MovieInfoDisplay()
}
