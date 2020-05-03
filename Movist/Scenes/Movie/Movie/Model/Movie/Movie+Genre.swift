//
//  Movie+Genre.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public extension Movie {
    
    struct Genre: ImmutableMappable {
        
        let id: Int?
        let name: String?
        
        public init(map: Map) throws {
            id = try? map.value("id")
            name = try? map.value("name")
        }
    }
}
