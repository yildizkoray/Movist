//
//  String+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension String {
    
    static let empty = ""
    static let newline = "\n"
    static let slash = "/"
    static let bullet = " • "
    static let whitespace = " "
    
    var isNotEmpty: Bool {
        return isEmpty == false
    }
    
    func date(using formatter: DateFormatter) -> Date? {
        return formatter.date(from: self)
    }
    
    var image: UIImage {
        return UIImage(named: self) ?? UIImage()
    }
    
    var imageView: UIImageView {
        return UIImageView(image: image)
    }
    
    var url: URL? {
        return URL(string: self)
    }
}

// MARK: - Optional

public extension Optional where Wrapped == String {
    
    var emptyIfNil: Wrapped {
        return ifNil(.empty)
    }
    
    func backdrop(for config: BackdropSize = .w780) -> URL? {
        guard let self = self else { return nil }
        let path: String = "\(config.rawValue)/\(self)"
        return URL(string: path, relativeTo: .TMDB_IMAGE_URL)
    }
    
    func poster(for config: PosterSize = .w342) -> URL? {
        guard let self = self else { return nil }
        let path: String = "\(config.rawValue)\(self)"
        return URL(string: path, relativeTo: .TMDB_IMAGE_URL)
    }
}
