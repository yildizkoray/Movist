//
//  URL+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension URL {
    
    static func randomIcon(width: Int, height: Int) -> URL {
        return URL(string: "https://picsum.photos/\(width)/\(height)")!
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
