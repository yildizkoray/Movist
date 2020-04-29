//
//  ThirdCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class ThirdCoordinator: Coordinator {
    
    public typealias Controller = ThirdViewController
    
    private weak var navigator: UINavigationController!
    
    private func start(with navigator: UINavigationController) {
        defer { self.navigator = navigator }
        
        let view = createViewController()
        
        navigator.pushViewController(view, animated: true)
    }
    
    public func start() {
        if let navigator = UIViewController.topMostViewController?.navigationController {
            start(with: navigator)
        }
    }
}
