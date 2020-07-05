//
//  UIFont+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 17.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public struct Font {
    
    public enum Family {
        case bahijTheSansArabic
    }
    
    public enum Weight {
        case black
        case bold
        case extrabold
        case extralight
        case light
        case plain
        case semibold
        case semilight
    }
    
    public enum Style {
        case regular
        case title
        case largeTitle
        
        var size: CGFloat {
            switch self {
            case .regular:
                return 13.0
            case .title:
                return 24.0
            case .largeTitle:
                return 34.0
            }
        }
    }
    
    public let family: Family
    public let weight: Weight
    public let style: Style
    
    fileprivate var name: String {
        switch weight {
        case .black:
            return "Bahij_TheSansArabic-Black"
        case .bold:
            return "Bahij_TheSansArabic-Bold"
        case .extrabold:
            return "Bahij_TheSansArabic-ExtraBold"
        case .extralight:
            return "Bahij_TheSansArabic-ExtraLight"
        case .light:
            return "Bahij_TheSansArabic-Light"
        case .plain:
            return "Bahij_TheSansArabic-Plain"
        case .semibold:
            return "Bahij_TheSansArabic-SemiBold"
        case .semilight:
            return "Bahij_TheSansArabic-SemiLight"
        }
    }
}

extension UIFont {
    
    static func font(
        family: Font.Family = .bahijTheSansArabic,
        weight: Font.Weight = .semilight,
        style: Font.Style = .regular
    ) -> UIFont{
        
        let font = Font(family: family, weight: weight, style: style)
        return UIFont(name: font.name, size: style.size)!
    }
}
