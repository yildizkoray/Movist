//
//  MovieSectionHeaderView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 9.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieSectionHeaderView: UITableViewHeaderFooterView {
    
    var clickedSeeAll: VoidCallback? = nil
    
    @IBOutlet private weak var type: UILabel!
    
    public func configure(with type: String) {
        self.type.text = type
    }
    @IBAction func clickedSeeAllButton(_ sender: UIButton) {
        clickedSeeAll?()
    }
}
