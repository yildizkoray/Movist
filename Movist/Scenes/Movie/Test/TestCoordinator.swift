//
//  TestCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 24.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class TestCoordinator: Coordinator {
    
    public typealias Controller = TestViewController
    
    
    private weak var navigator: UINavigationController!
    
    public init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    public func start() {
        
        let view = createViewController()
        navigator.pushViewController(view, animated: true)
    }
}
