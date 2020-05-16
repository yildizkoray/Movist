//
//  Movie+Cast.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public extension Movie {
    
    struct Cast: ImmutableMappable {
        
        enum Gender: Int {
            case femaale = 0
            case male = 1
        }
        
        let castId: String?
        let character: String?
        let creditId: String?
        let gender: Gender?
        let id: String?
        let name: String?
        let order: Int?
        let poster: String?
        
        public init(map: Map) throws {
            castId = try? map.value("cast_id")
            character = try? map.value("character")
            creditId = try? map.value("credit_id")
            gender = try? map.value("gender", using: EnumTransform<Gender>())
            id = try? map.value("id")
            order = try? map.value("order")
            name = try? map.value("name")
            poster = try? map.value("profile_path")
        }
    }
}
