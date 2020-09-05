//
//  MovieTableViewCell.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private (set) weak var movieCollectionView: MovieCollectionView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(display: [MovieItemDisplay]) {
        movieCollectionView.display = display
    }
}
