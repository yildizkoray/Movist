//
//  CastView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class CastView: UIView, NibLoadable {
    
    @IBOutlet private weak var poster: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var character: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    public func configure(with display: VisualContent) {
        poster.setVisual(display.visual)
        name.hidableText = display.title
        character.hidableText = display.subtitle
    }
}
