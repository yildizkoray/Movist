//
//  AppDelegate.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 16.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger

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
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
    }
    
    private func prepareUISettings() {
//        TODO: - This color should move AppColor class
        UINavigationBar.appearance().backgroundColor = UIColor(red: 29, green: 29, blue: 39)
        UINavigationBar.appearance().barTintColor = UIColor(red: 29, green: 29, blue: 39)
        UIBarButtonItem.appearance().tintColor = UIColor(red: 29, green: 29, blue: 39)
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        
        UITabBar.appearance().backgroundColor = UIColor(red: 29, green: 29, blue: 39)
        UITabBar.appearance().tintColor = UIColor(red: 29, green: 29, blue: 39)
        UITabBar.appearance().barTintColor = UIColor(red: 29, green: 29, blue: 39)
        UINavigationBar.appearance().isTranslucent = false
        UITabBar.appearance().isTranslucent = false
    }
}

