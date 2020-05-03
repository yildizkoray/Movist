//
//  Movie+ProductionCompany.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public extension Movie {
    
    struct ProductionCompany: ImmutableMappable {
        
        let id: Int?
        let logoImage: String?
        let name: String?
        let originCountry: String?
        
        public init(map: Map) throws {
            id = try? map.value("id")
            logoImage = try? map.value("logo_path")
            name = try? map.value("name")
            originCountry = try? map.value("origin_country")
        }
    }
}
