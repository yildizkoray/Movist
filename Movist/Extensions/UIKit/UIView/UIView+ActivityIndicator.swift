//
//  UIView+ActivityIndicator.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 9.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIView {
    
    private struct AssociationKeys {
        static var activityIndicatorView = "movist_ui_activityIndicatorView"
    }
    
    @objc var activityIndicatorView: UIActivityIndicatorView {
        if let activityIndicatorView = objc_getAssociatedObject(
            self, &AssociationKeys.activityIndicatorView) as? UIActivityIndicatorView {
            return activityIndicatorView
        }
        
        let activityIndicatorView = UIActivityIndicatorView.create(style: .white)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addConstraints(NSLayoutConstraint.constraints(
          withVisualFormat: "V:|->=8@999-[activityIndicatorView]->=8@999-|",
          options: [],
          metrics: [:],
          views: ["activityIndicatorView": activityIndicatorView]))
        
        objc_setAssociatedObject(self, &AssociationKeys.activityIndicatorView,
                                 activityIndicatorView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        return activityIndicatorView
    }
    
    func startLoadingIndicatorView(color: UIColor) {
      activityIndicatorView.color = color
      startLoadingIndicatorView()
    }

    @objc func startLoadingIndicatorView() {
      activityIndicatorView.startAnimating()
    }

    @objc func stopLoadingIndicatorView() {
      activityIndicatorView.stopAnimating()
    }
}
