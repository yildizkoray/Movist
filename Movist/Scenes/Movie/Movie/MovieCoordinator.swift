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
        
        let view = createViewController()
        view.viewModel = MovieViewModel()
        view.viewModel.coordinator = self
        
        let navigator = UINavigationController(rootViewController: view)
        
        defer { self.navigator = navigator }
        
        navigator.tabBarItem = UITabBarItem(
            title: "Movie", image: "tab-movie".image, selectedImage: "tab-movie-selected".image
        )
        navigator.setViewControllers([view], animated: false)
        
        return navigator
    }
    
    public func show(detatilWith id: Int) {
        let coordinator = MovieDetailCoordinator(with: navigator)
        coordinator.start(with: id)
    }
}
