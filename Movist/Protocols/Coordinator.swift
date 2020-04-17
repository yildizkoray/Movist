//
//  Coordinator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
}
