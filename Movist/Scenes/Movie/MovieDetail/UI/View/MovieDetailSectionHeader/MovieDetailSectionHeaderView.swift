//
//  MovieDetailHeaderView.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 13.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

private struct Constants {
    
    struct Gradient {
        static let color: [UIColor] = [.clear, UIColor(red: 47, green: 47, blue: 59, alpa: 0.8)]
        static let points = (start: CGPoint(x: 0.5, y: .zero), end: CGPoint(x: 0.5, y: 1))
        static let locations: [NSNumber] = [0.7, 1.0]
    }
}

// MARK: - UITableViewHeaderFooterView

public final class MovieDetailSectionHeaderView: UITableViewHeaderFooterView {
    
    var didClickPlayTrailler: VoidCallback?
    
    @IBOutlet private weak var backdrop: UIImageView!
    @IBOutlet private weak var display: MovieInfoView!
    
    public func configure(with display: MovieDetailHeaderDisplay) {
        
        backdrop.set_af_image(url: display.backdrop)
        self.display.configure(with: display.display)
        
        backdrop.addGradient(Constants.Gradient.color,
                             Constants.Gradient.locations,
                             Constants.Gradient.points)
    }
    
    @IBAction func playTraillerTapped(_ sender: UIButton) {
        didClickPlayTrailler?()
    }
}

