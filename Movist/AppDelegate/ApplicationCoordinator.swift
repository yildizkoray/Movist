//
//  ApplicationCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class ApplicationCoordinator {
    
    
    
    public func start(with window: UIWindow) {
        let view = ViewController.instantiate(for: .main)
        window.rootViewController = view
        window.makeKeyAndVisible()
    }
}
