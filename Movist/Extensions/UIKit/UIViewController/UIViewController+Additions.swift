//
//  UIViewController+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    class var topMostViewController: UIViewController? {
        var rootViewController: UIViewController?
        if let windowRootViewController = UIApplication.shared.keyWindow?.rootViewController {
            rootViewController = windowRootViewController
        }
        return topMostViewController(of: rootViewController)
    }
    
    class func topMostViewController(of viewController: UIViewController?) -> UIViewController? {
        
        //         presented view controller
        if let presentedViewController = viewController?.presentedViewController,
            !(presentedViewController is UISearchController) {
            return topMostViewController(of: presentedViewController)
        }
        
        //         UITabBarController
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return topMostViewController(of: selectedViewController)
        }
        
        //         UINavigationController
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return topMostViewController(of: visibleViewController)
        }
        
        //         UIPageController
        if let pageViewController = viewController as? UIPageViewController,
            pageViewController.viewControllers?.count == 1 {
            return topMostViewController(of: pageViewController.viewControllers?.first)
        }
        
        //         Child view controller
        for subview in viewController?.view?.subviews ?? [] {
            if let childViewController = subview.next as? UIViewController {
                return topMostViewController(of: childViewController)
            }
        }
        
        return viewController
    }
    
    class var topMostNavigationController: UINavigationController? {
        
        let topMostViewController = self.topMostViewController
        
        if let navigationController = topMostViewController as? UINavigationController {
            return navigationController
        }
        else {
            return topMostViewController?.navigationController
        }
    }
}
