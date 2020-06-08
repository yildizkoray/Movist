//
//  UIEdgeInsets+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 8.06.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    init(edges: CGFloat) {
        self.init(horizontal: edges, vertical: edges)
    }
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal,
                  bottom: vertical, right: horizontal)
    }
    
    var horizontal: CGFloat {
        return left + right
    }
    
    var vertical: CGFloat {
        return top + bottom
    }
}
