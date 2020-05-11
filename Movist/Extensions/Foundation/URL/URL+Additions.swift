//
//  URL+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

// MARK: - URL+Endpoints

public extension URL {
    
    private static let RANDOM_IMAGE_BASE_URL = URL(string: ConfigReader.shared["RANDOM_IMAGE_URL"])!
    static let TMDB_API_URL = URL(string: ConfigReader.shared["TMDB_API_URL"])!
    static let TMDB_IMAGE_URL = URL(string: ConfigReader.shared["TMDB_IMAGE_URL"])!
}

// MARK: - URL+Images

public extension URL {
    
    static func backdrop(for config: BackdropSize = .w300, file: String) -> URL {
        let path: String = "\(config.rawValue)/\(file)"
        return URL(string: path, relativeTo: .TMDB_IMAGE_URL)!
    }
    
    static func poster(for config: PosterSize = .w342, file: String) -> URL {
        let path: String = "\(config.rawValue)\(file)"
        return URL(string: path, relativeTo: .TMDB_IMAGE_URL)!
    }
    
    static func randomIcon(width: Int = 200, height: Int = 200) -> URL {
        let path: String = "\(width)/\(height)"
        return URL(string: path, relativeTo: .RANDOM_IMAGE_BASE_URL)!
    }
}

// MARK: - URL+VisualContent

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
