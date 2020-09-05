//
//  MovieDetailCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieDetailCoordinator: Coordinator {
    
    public typealias Controller = MovieDetailViewController
    
    private weak var navigator: UINavigationController!
    
    public init(with navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    public func start(with id: Int) {
        
        let view = createViewController()
        view.viewModel = MovieDetailViewModel(with: id)
        view.viewModel.coordinator = self
        
        navigator.pushViewController(view, animated: true)
    }
}
