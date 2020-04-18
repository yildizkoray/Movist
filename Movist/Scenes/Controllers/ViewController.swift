//
//  ViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol ViewController: class {
    static var storyboardName: UIStoryboard.Name { get }
}

public extension ViewController where Self: UIViewController {
    
    private static func allocate<T: UIViewController>(suffix: String) -> T {
        guard let identifier = "\(self)".components(separatedBy: "ViewController").first
            else {
                preconditionFailure("Unable to initialize view controller with name: \(self)")
        }
        return StoryboardLoader.shared.board(with: storyboardName).allocate(with: identifier + suffix)
    }
    
    static func controller() -> Self {
        return allocate(suffix: .empty)
    }
    
    static func navigation() -> UINavigationController {
        return allocate(suffix: "Navigation")
    }
}
