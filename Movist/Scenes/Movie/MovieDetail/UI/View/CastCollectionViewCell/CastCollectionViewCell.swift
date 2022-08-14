//
//  CastCollectionViewCell.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var castView: CastView!

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with content: VisualContent) {
        castView.configure(with: content)
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        castView.configure(with: .empty)
    }
}
