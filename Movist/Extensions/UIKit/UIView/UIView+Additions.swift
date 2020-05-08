//
//  UIView+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 3.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public struct Duration {
    static let `default` = 0.25
}

public extension UIView {
    
    func setHidden(_ isHidden: Bool, animated: Bool, completion: Callback<Bool>? = nil) {
        guard self.isHidden != isHidden else { return }
        
        if animated {
            UIView.transition(
                with: self,
                duration: Duration.default,
                options: .transitionCrossDissolve,
                animations: { self.isHidden = isHidden },
                completion: completion)
        }
        else {
            self.isHidden = isHidden
            completion?(true)
        }
    }
}

// UIView - @IBInspectable

public extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
