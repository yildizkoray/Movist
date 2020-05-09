//
//  UpComing.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 9.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public struct UpComing: ImmutableMappable {
    
    let movies: [Movie]
    let page: Int?
    let pageCount: Int?
    let resultCount: Int?
    
    public init(map: Map) throws {
        
        movies = try map.value("results")
        page = try? map.value("page")
        pageCount = try? map.value("total_pages")
        resultCount = try? map.value("total_results")
    }
}
