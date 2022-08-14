//
//  UIAlertAction+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 24.10.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

private struct Constants {
    static let titleForOkayAction = "Tamam"
}

public extension UIAlertAction {
    
    convenience init(_ title: String, style: UIAlertAction.Style = .default, action: @escaping VoidCallback) {
        self.init(title: title, style: style) { _ in
            action()
        }
    }
    
    class func okay(action: @escaping VoidCallback = voidCallback()) -> UIAlertAction {
        return .init(Constants.titleForOkayAction, action: action)
    }
}
