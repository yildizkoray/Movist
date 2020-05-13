//
//  RateStarView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Cosmos
import UIKit

public final class RateStarView: UIView, NibLoadable {
    
    @IBOutlet private weak var rate: UILabel!
    @IBOutlet private weak var stars: CosmosView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    public func configure(display: RateStarDisplay) {
        rate.hidableText = display.rate
        stars.settings = display.settings
    }
}
