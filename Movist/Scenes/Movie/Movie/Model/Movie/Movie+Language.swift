//
//  Movie+Language.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

extension Movie {
    
    struct Language: ImmutableMappable {
        
        let iso_3166_1: String?
        let englishName: String?
        let name: String?
        
        public init(map: Map) throws {
            iso_3166_1 = try? map.value("adult")
            englishName = try? map.value("adult")
            name = try? map.value("adult")
        }
    }
}
