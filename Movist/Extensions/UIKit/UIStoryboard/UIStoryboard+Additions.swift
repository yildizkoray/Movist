//
//  UIStoryboard+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    enum Name: String {
        case movie
        
        public var description: String {
            return rawValue.capitalized
        }
    }
    
    func allocate<T: UIViewController>(with identifier: String) -> T {
        let view = instantiateViewController(withIdentifier: identifier) as! T
        return view
    }
    
    func load(_ name: UIStoryboard.Name) -> UIStoryboard {
        return StoryboardLoader.shared.board(with: name.description)
    }
}

public final class StoryboardLoader {
    
    static let shared = StoryboardLoader()
    
    private var cache: [String: UIStoryboard]
    private var bundle: Bundle
    
    public init(bundle: Bundle = .main) {
        self.bundle = bundle
        self.cache = [:]
    }
    
    private func removeAll() {
        cache.removeAll()
    }
    
    func board(with name: String) -> UIStoryboard {
        if let storyboard = cache[name] {
            return storyboard
        }
        else {
            let storyboard = UIStoryboard(name: name, bundle: bundle)
            cache[name] = storyboard
            
            return storyboard
        }
    }
    
    func board(with name: UIStoryboard.Name) -> UIStoryboard {
        return board(with: name.description)
    }
}
