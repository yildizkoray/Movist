//
//  AlertService.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 24.10.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class AlertService {
    
    public class func show(alert: UIAlertController, onto view: UIViewController? = nil) {
        if let view = view ?? UIViewController.topMostViewController {
            view.present(alert, animated: true)
        }
    }
}
