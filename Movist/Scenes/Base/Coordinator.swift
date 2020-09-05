//
//  Coordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol Coordinator {
    
    associatedtype Controller: ViewController
    
    func createViewController() -> Controller
    func createNavigationViewController() -> UINavigationController
}

public extension Coordinator where Controller: UIViewController {
    
    func createViewController() -> Controller {
        return Controller.controller()
    }
    
    func createNavigationViewController() -> UINavigationController {
        return Controller.navigation()
    }
}
