//
//  CastItemDisplay.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

public struct CastDisplay {
    
    let id: Int
    let content: VisaulContent
    let gender: Movie.Cast.Gender
    let order: Int
    
    public init(with item: Movie.Cast) {
        id = item.id.ifNil(.zero)
        
        content = VisaulContent(
            title: item.name.emptyIfNil,
            subtitle: item.character.emptyIfNil,
            visual: .url(.poster(for: .w185, file: item.poster.emptyIfNil))
        )
        
        gender = item.gender.ifNil(Movie.Cast.Gender.femaale)
        order = item.order.ifNil(.zero)
    }
    
    private init() {
        id = .zero
        content = .empty
        gender = .femaale
        order = .zero
    }
    
    static let empty = CastDisplay()
}
