//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Pedro Contreras on 2018-06-26.
//  Copyright © 2018 Pedro Contreras. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appBuilder = AppBuilder()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        appBuilder.buildApp(window: self.window!)
        self.window?.isHidden = false
        return true
    }
}
