//
//  MovieCollectionViewCell.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieView: MovieView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(rate: Double, image: UIImage) {
        movieView.configure(rate: rate, image: image)
    }
}
