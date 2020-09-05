//
//  MovieSectionHeaderView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 9.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieSectionHeaderView: UITableViewHeaderFooterView {
    
    public var didClickedSeeAll: Callback<MovieType>?
    
    @IBOutlet private weak var title: UILabel!
    private var type: MovieType = .popular
    
    public func configure(with display: MovieHeaderDisplay) {
        self.title.hidableText = display.title
        self.type = display.type
    }
    
    @IBAction func clickedSeeAllButton(_ sender: UIButton) {
        didClickedSeeAll?(type)
    }
}
