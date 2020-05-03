//
//  Movie+ProductionCountry.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public extension Movie {
    
    struct ProductionCountry: ImmutableMappable {
        
        let iso_3166_1: String?
        let name: String?
        
        public init(map: Map) throws {
            iso_3166_1 = try? map.value("iso_3166_1")
            name = try? map.value("name")
        }
    }
}
