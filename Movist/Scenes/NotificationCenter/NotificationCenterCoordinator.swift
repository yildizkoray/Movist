//
//  NotificationCenterCoordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.07.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class NotificationCenterCoordinator: Coordinator {
    
    public typealias Controller = NotificationCenterViewController
    
    private weak var navigator: UINavigationController!
    
    public func start(with navigator: UINavigationController) {
        defer { self.navigator = navigator }
        
        let view = createViewController()
        navigator.pushViewController(view, animated: true)
    }
}
