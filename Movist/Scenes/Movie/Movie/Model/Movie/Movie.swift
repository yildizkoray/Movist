//
//  Movie.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 29.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public struct Movie: ImmutableMappable {
    
    let averageVote: Double?
    let isAdult: Bool?
    let backdrop: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let origianalTitle: String?
    let overview: String?
    let popularity: Double?
    let poster: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: Date?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [Language]?
    let status: Status?
    let tagline: String?
    let title: String?
    let totalVoteCount: Double?
    let video: Bool?
    
    let cast: [Cast]?
    let similars: [Movie]?
    let reviews: [Review]?
    
    public init(map: Map) throws {
        
        backdrop = try? map.value("backdrop_path")
        genres = try? map.value("genres")
        homepage = try? map.value("homepage")
        id = try? map.value("id")
        isAdult = try? map.value("adult")
        imdbId = try? map.value("imdb_id")
        originalLanguage = try? map.value("original_language")
        origianalTitle = try? map.value("original_title")
        overview = try? map.value("overview")
        popularity = try? map.value("popularity")
        poster = try? map.value("poster_path")
        productionCompanies = try? map.value("production_companies")
        productionCountries = try? map.value("production_countries")
        releaseDate = try? map.value("release_date")
        revenue = try? map.value("revenue")
        runtime = try? map.value("runtime")
        spokenLanguages = try? map.value("spoken_languages")
        status = try? map.value("status", using: EnumTransform<Status>())
        tagline = try? map.value("tagline")
        title = try? map.value("title")
        video = try? map.value("video")
        averageVote = try? map.value("vote_average")
        totalVoteCount = try? map.value("vote_count")
        
        cast = try? map.value("casts.cast")
        similars = try? map.value("similar.results")
        reviews = try? map.value("reviews.results")
    }
}
