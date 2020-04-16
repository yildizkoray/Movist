//
//  UITableView+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCells(for types: UITableViewCell.Type...) {
        
        types.forEach { type in
            register(type.nib, forCellReuseIdentifier: String(describing: type))
        }
    }
    
    func dequeueReusableCell<C: UITableViewCell>(for indexPath: IndexPath) -> C {
        
        let identifier = String(describing: C.self)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! C
    }
}
