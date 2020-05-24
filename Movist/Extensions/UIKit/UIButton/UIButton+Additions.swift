//
//  UIButton+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIButton {
    
    convenience init(title: String, image: UIImage? =  nil, action: @escaping VoidCallback) {
        self.init(type: .system)
        
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        
        self.action = { _ in action() }
    }
    
    class func test() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Test", for: .normal)
        
        button.action = { _ in
            if let navigation = UIViewController.topMostNavigationController {
                TestCoordinator(navigator: navigation).start()
            }
        }
        
        return button
    }
}

// MARK:- Action

public extension UIButton {
    
    private struct AssociatedKey {
        static var key = "movist_button_touchUpInsideBlock"
    }
    
    var action: Callback<UIButton>? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.key) as? Callback<UIButton>
        }
        set {
            removeTarget(self, action: #selector(click), for: .touchUpInside)
            addTarget(self, action: #selector(click), for: .touchUpInside)
            
            objc_setAssociatedObject(self, &AssociatedKey.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    @objc private func click() {
        action?(self)
    }
}
