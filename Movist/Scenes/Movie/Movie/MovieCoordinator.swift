//
//  MovieCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieCoordinator: Coordinator {
    public typealias Controller = MovieViewController
    
    private weak var navigator: UINavigationController!
    
    public func start() -> UINavigationController {
        defer { self.navigator = navigator }
        
        let view = createViewController()
        let navigator = UINavigationController(rootViewController: view)
        
        navigator.tabBarItem = UITabBarItem(
            title: "tabbarTitle", image: "tab-casino".image, selectedImage: "tab-casino-selected".image
        )
        navigator.setViewControllers([view], animated: false)
        
        return navigator
    }
}
