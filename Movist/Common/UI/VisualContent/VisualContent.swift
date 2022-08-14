//
//  VisualContent.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 23.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public struct VisualContent {
    
    public enum Visual {
        case `static`(UIImage)
        case url(URL)
    }
    
    public let title: String
    public let subtitle: String
    public let visual: Visual?
    
    public init(title: String, subtitle: String = .empty, visual: Visual? = .none) {
        
        self.title = title
        self.subtitle = subtitle
        self.visual = visual
    }
    
    public var image: UIImage? {
        if case .static(let image) = visual {
            return image
        }
        return nil
    }
    
    public static let empty = VisualContent(title: .empty)
}
