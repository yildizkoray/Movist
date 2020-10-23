//
//  CastItemDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public struct CastDisplay {
    
    let id: Int
    let content: VisualContent
    let gender: Movie.Cast.Gender
    let order: Int
    
    public init(with item: Movie.Cast) {
        id = item.id.ifNil(.zero)
        
        content = VisualContent(
            title: item.name.emptyIfNil,
            subtitle: item.character.emptyIfNil,
            visual: item.poster.poster(for: .w185).visual
        )
        
        gender = item.gender.ifNil(Movie.Cast.Gender.female)
        order = item.order.ifNil(.zero)
    }
    
    private init() {
        id = .zero
        content = .empty
        gender = .female
        order = .zero
    }
    
    static let empty = CastDisplay()
}
