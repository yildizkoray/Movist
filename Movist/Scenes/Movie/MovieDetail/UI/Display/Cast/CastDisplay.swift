//
//  CastItemDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public struct CastDisplay {
    
    let id: String
    let character: String
    let name: String
    let gender: Movie.Cast.Gender
    let order: Int
    let poster: String
    
    public init(with item: Movie.Cast) {
        id = item.id.emptyIfNil
        character = item.character.emptyIfNil
        name = item.name.emptyIfNil
        gender = item.gender.ifNil(Movie.Cast.Gender.femaale)
        order = item.order.ifNil(.zero)
        poster = item.poster.emptyIfNil
    }
    
    private init() {
        id = .empty
        character = .empty
        name = .empty
        gender = .femaale
        order = .zero
        poster = .empty
    }
    
    static let empty = CastDisplay()
}
