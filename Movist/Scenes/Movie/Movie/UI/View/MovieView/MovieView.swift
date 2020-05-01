//
//  MovieView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 2.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class MovieView: UIView, NibLoadable {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var image: UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    public func configure(name: String, image: UIImage) {
        self.name.hidableText = name
        self.image.hidableImage = image
    }
}
