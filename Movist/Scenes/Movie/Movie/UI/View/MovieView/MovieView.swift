//
//  MovieView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import Cosmos

public final class MovieView: UIView, NibLoadable {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var ratingView: CosmosView! {
        didSet {
            ratingView.settings.fillMode = .full
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    public func configure(display: MovieItemDisplay) {
        
        name.hidableText = display.content.title
        ratingLabel.hidableText = display.rating.string
        image.setVisual(display.content.visual)
        ratingView.rating = display.rating / 2
    }
}
