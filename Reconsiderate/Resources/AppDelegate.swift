//
//  AppDelegate.swift
//  Reconsiderate
//
//  Created by Dev on 7/31/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nav = UINavigationController()
        coordinator = AppCoordinator(navigationController: nav)
        
        createThoughtContainer { (container) in
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.makeKeyAndVisible()
            
            self.coordinator?.context = container.viewContext
            
            self.coordinator?.start()
            
            self.window?.rootViewController = nav
            IQKeyboardManager.shared.enable = true
            
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

}

