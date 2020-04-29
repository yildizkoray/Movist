//
//  UICollectionView+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 29.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func registerCells(for types: UICollectionViewCell.Type...) {
        
        types.forEach { type in
            register(type.nib, forCellWithReuseIdentifier: String(describing: type))
        }
    }
    
    func dequeueReusableCell<C: UICollectionViewCell>(for indexPath: IndexPath) -> C {
        
        let identifier = String(describing: C.self)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! C
    }
}
