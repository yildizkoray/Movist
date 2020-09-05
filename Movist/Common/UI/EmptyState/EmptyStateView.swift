//
//  EmptyStateView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 22.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class EmptyStateView: UIView, NibLoadable {
    
    
    @IBOutlet private weak var info: UIImageView!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var title: UILabel!

    
    public override init(frame: CGRect) {
      super.init(frame: frame)
      self.setupFromNib()
    }

    public required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.setupFromNib()
    }
    
    
    public func configure(visualContent: VisaulContent, info: UIImage = "empty_info".image) {
        
        self.info.hidableImage = info
        self.image.hidableImage = visualContent.image
        self.title.hidableText = visualContent.title
    }
}


