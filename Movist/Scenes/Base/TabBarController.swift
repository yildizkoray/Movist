//
//  TabBarController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public class TabBarController: UITabBarController {
    
      public override func viewDidLoad() {
      super.viewDidLoad()
      delegate = self
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    
    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title ?? .empty)
    }
}
