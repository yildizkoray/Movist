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
    let overview: String
    
    public init(with movie: Movie) {
        content = VisaulContent(
            title: movie.title.emptyIfNil,
            subtitle: movie.overview.emptyIfNil,
            visual: .url(.poster(file: movie.poster.emptyIfNil))
        )
        
        rateStarDisplay = RateStarDisplay(rate: movie.averageVote.ifNil(.zero))
        
        var genres: [String] = .empty()
        movie.genres.ifNil(.empty()).forEach {
            genres.append( $0.name.emptyIfNil)
        }
        genre = genres.joined(separator: " • ")
        
        language = "Language: \(movie.originalLanguage.emptyIfNil)"
        overview = movie.overview.emptyIfNil
    }
    
    private init() {
        content = .empty
        rateStarDisplay = .empty
        genre = .empty
        language = .empty
        overview = .empty
    }
    
    public static let empty = MovieInfoDisplay()
}
