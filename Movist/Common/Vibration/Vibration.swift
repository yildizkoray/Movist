//
//  Vibration.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 6.05.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import AudioToolbox

public final class Vibration {
    
    static let shared = Vibration()
    
    enum SystemSound: Int {
        case `default` = 4095
        case peek = 1519
        case pop = 1520
        case cancel = 1521
        case tryAgain = 1102
        case failed = 1107
    }
    
    func vibrate(with systemSound: SystemSound) {
        let id = SystemSoundID(systemSound.rawValue)
        AudioServicesPlaySystemSound(id)
    }
    
    func vibrate(with type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func vibrate(with style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }

    func vibrateSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}
