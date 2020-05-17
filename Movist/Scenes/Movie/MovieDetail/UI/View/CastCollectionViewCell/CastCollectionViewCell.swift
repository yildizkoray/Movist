//
//  CastCollectionViewCell.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var castView: CastView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with content: VisaulContent) {
        castView.configure(with: content)
    }
}
