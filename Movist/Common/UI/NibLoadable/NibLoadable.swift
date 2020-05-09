//
//  NibLoadable.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 22.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol NibLoadable {
    
    func setupFromNib()
    func setupFromNibWithoutSafeArea()
}

public extension NibLoadable where Self: UIView {
    
    func setupFromNib() {
        
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error loading \(self) from nib")
        }
        
        addSubViewAndConstraintToSafeArea(view)
    }
    
    func setupFromNibWithoutSafeArea() {
        
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error loading \(self) from nib")
        }
        
        addSubViewAndConstraintToWithoutSafeArea(view)
    }
}
