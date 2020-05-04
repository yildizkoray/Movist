//
//  URL+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension URL {
    
    private static let RANDOM_IMAGE_BASE_URL = URL(string: ConfigReader.shared["RANDOM_IMAGE_URL"])!
    static let TMDB_API_URL = URL(string: ConfigReader.shared["TMDB_API_URL"])!
    static let TMDB_IMAGE_URL = URL(string: ConfigReader.shared["TMDB_IMAGE_URL"])!
    
    static func randomIcon(width: Int, height: Int) -> URL {
        let path: String = "\(width)/\(height)"
        return URL(string: path, relativeTo: .RANDOM_IMAGE_BASE_URL)!
    }
}

public extension Optional where Wrapped == URL {
    
    var visual: VisaulContent.Visual? {
        switch self {
        case .none:
            return nil
        case .some(let url):
            return .url(url)
        }
    }
}
