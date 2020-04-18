//
//  SecondCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class SecondCoordinator: Coordinator {
    
    public typealias Controller = SecondViewController
    
    
    private weak var navigator: UINavigationController!
    
    public func start() -> UINavigationController {
        defer { self.navigator = navigator }
        
        let view = createViewController()
        let navigator = UINavigationController(rootViewController: view)
        
        navigator.tabBarItem = UITabBarItem(
          title: "Second", image: "second".image, selectedImage: "second-selected".image
        )
        navigator.setViewControllers([view], animated: false)
        
        return navigator
    }
}
