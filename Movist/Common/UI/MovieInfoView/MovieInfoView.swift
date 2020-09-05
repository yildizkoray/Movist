//
//  MovieInfoView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieInfoView: UIView, NibLoadable {
    
    @IBOutlet private weak var poster: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var rateStarView: RateStarView!
    @IBOutlet private weak var genre: UILabel!
    @IBOutlet private weak var language: UILabel!
    @IBOutlet private weak var runtime: UILabel!
    @IBOutlet private weak var overview: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    public func configure(with display: MovieInfoDisplay) {
        poster.setVisual(display.content.visual)
        name.hidableText = display.content.title
        rateStarView.configure(display: display.rateStarDisplay)
        genre.hidableText = display.genre
        language.hidableText = display.language
        runtime.hidableText = display.runtime
        overview.hidableText = display.overview
    }
}
