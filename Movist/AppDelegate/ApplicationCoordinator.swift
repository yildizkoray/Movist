//
//  ApplicationCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class ApplicationCoordinator {
    
    var tabController: TabBarController
    
    public init() {
        tabController = TabBarController()
    }
    
    public func start(with window: UIWindow) {
        prepareTabs()
        
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
    
    private func prepareTabs() {
        var views: [UIViewController] = .empty()
        
        views.insert(MovieCoordinator().start(), at: 0)
        views.insert(SecondCoordinator().start(), at: 1)
        
        tabController.setViewControllers(views, animated: false)
    }
}
