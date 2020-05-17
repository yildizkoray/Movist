//
//  MovieDetailTableViewCell.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {
    
    @IBOutlet private (set) weak var castCollectionView: CastCollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(with display: [CastDisplay]) {
        castCollectionView.display = display
    }
}
