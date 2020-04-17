//
//  Storyboarded.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol Storyboarded {
    static func instantiate(for board: UIStoryboard.Name) -> Self
}

public extension Storyboarded where Self: UIViewController {
    
    static func instantiate(for board: UIStoryboard.Name) -> Self {
        
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: board.description, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
