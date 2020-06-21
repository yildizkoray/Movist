//
//  Movie+Review.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 21.06.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public extension Movie {
    
    struct Review: ImmutableMappable {
        
        let author: String?
        let content: String?
        let id: String?
        let url: String?
        
        public init(map: Map) throws {
            author = try? map.value("author")
            content = try? map.value("content")
            id = try? map.value("id")
            url = try? map.value("url")
        }
    }
}
