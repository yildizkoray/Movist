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
    static let whitespace = " "
    static let TMDB_API_KEY = ConfigReader.shared["TMDB_API_KEY"]
    
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
}
