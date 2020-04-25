//
//  UIView+EmptyState.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol EmptyStateShowing: class {
    
    var emptyStateView: EmptyStateView { get }
    
    var isEmptyStateVisible: Bool { get }
    
    func hideEmptyState(animated: Bool)
    func showEmptyState(with content: VisaulContent)
}

extension UIView: EmptyStateShowing {
    
    public var emptyStateView: EmptyStateView {
        
        if let view = objc_getAssociatedObject(self, AssociationKeys.emptyStateView) as? EmptyStateView {
            return view
        }
        
        let view = EmptyStateView(frame: .zero)
        view.isHidden = true
        
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            view.widthAnchor.constraint(equalTo: widthAnchor),
            view.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        objc_setAssociatedObject(self, AssociationKeys.emptyStateView, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        return view
    }
    
    public var isEmptyStateVisible: Bool {
        return emptyStateView.isHidden == false
    }
    
    public func hideEmptyState(animated: Bool) {
        emptyStateView.isHidden = true
    }
    
    public func showEmptyState(with content: VisaulContent) {
        bringSubviewToFront(emptyStateView)
        emptyStateView.isHidden = false
        emptyStateView.configure(visualContent: content)
    }
    
    
    private struct AssociationKeys {
        static var emptyStateView = "movist_ui_emptyStateView"
    }
}
