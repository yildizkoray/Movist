//
//  MovieDetailHeaderView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieDetailSectionHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var backdrop: UIImageView!
    
    public func configure(with url: URL?) {
        backdrop.set_af_image(url: url)
    }
    
}

