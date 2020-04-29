//
//  Movie.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 29.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct Movie {
    
    public struct Genre {
        
        let id: Int
        let name: String
    }
    
    public struct ProductionCompany {
        
        let id: Int
        let logoImage: String
        let name: String
        let originCountry: String
    }
    
    public struct ProductionCountry {
        
        let iso_3166_1: String
        let name: String
    }
    
    public struct Language {
        
        let iso_3166_1: String
        let englishName: String
        let name: String
    }
    
    public enum Status: String {
        case released = "Released"
    }
    
    let isAdult: Bool
    let backdropImage: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbId: String
    let originalLanguage: String
    let origianalTitle: String
    let overview: String
    let popularity: String
    let posterImage: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: Date
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [Language]
    let status: Status
    let tagline: String
    let title: String
    let video: Bool
    let averageVote: Double
    let totalVoteCount: Double
}
