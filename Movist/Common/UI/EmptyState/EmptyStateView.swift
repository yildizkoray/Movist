//
//  EmptyStateView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 22.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class EmptyStateView: UIView, NibLoadable {
    
    
    @IBOutlet private weak var infoImage: UIImageView!
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    
    public override init(frame: CGRect) {
      super.init(frame: frame)
      self.setupFromNib()
    }

    public required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.setupFromNib()
    }
    
    
    public func configure(infoImage: UIImage?, titleImage: UIImage, title: String) {
        self.infoImage.image = infoImage
        self.titleImage.image = titleImage
        self.titleLabel.text = title
    }
}
