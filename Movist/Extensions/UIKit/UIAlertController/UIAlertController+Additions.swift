//
//  UIAlertController+Additions.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 24.10.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

private struct Constants {
    static let titleForGeneralError = "HATA"
    static let titleForOkayAction = "Tamam"
}

extension UIAlertController {
    
    convenience init(content: VisualContent, actions: UIAlertAction...) {
        self.init(title: content.title, message: content.subtitle, preferredStyle: .alert)
        actions.forEach { addAction($0)}
    }
    
    class func error(_ error: Error) -> UIAlertController {
        let content = VisualContent(title: Constants.titleForGeneralError, subtitle: error.asAPIError?.description ?? error.localizedDescription)
        return .init(content: content, actions: .okay())
    }
}
