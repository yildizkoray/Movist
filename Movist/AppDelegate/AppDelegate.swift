//
//  AppDelegate.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    public func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ApplicationCoordinator().start(with: window!)
        
        prepareNetworkLogger()
        prepareUISettings()
        
        return true
    }
    
    private func prepareNetworkLogger() {
        NetworkActivityLogger.shared.level = .error
        NetworkActivityLogger.shared.startLogging()
    }
    
    private func prepareUISettings() {
//        TODO: - This color should move AppColor class
        UINavigationBar.appearance().backgroundColor = UIColor(red: 47, green: 47, blue: 59)
        UINavigationBar.appearance().barTintColor = UIColor(red: 47, green: 47, blue: 59)
        UIBarButtonItem.appearance().tintColor = .white
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        
        UITabBar.appearance().backgroundColor = UIColor(red: 158, green: 158, blue: 188)
        UITabBar.appearance().tintColor = UIColor(red: 158, green: 158, blue: 188)
        UITabBar.appearance().barTintColor = UIColor(red: 47, green: 47, blue: 59)
        UINavigationBar.appearance().isTranslucent = false
        UITabBar.appearance().isTranslucent = false
    }
}

