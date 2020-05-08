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

// MARK: - Refresh Control

public extension UIScrollView {
    
    func addRefresher(color: UIColor = .lightGray, selector: Selector) {
        
        let refresher = UIRefreshControl()
        refresher.tintColor = color
        refresher.addTarget(nil, action: selector, for: .valueChanged)
        refreshControl = refresher
    }
    
    func endRefreshing() {
        refreshControl?.endRefreshing()
    }
}
