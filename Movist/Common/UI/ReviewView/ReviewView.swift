//
//  ReviewView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 20.06.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class ReviewView: UIView, NibLoadable {
    
    @IBOutlet private weak var author: UILabel!
    @IBOutlet private weak var comment: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
    }
    
    public func configure(with display: ReviewDisplay) {
        author.text = display.author
        comment.text = display.comment
    }
}
