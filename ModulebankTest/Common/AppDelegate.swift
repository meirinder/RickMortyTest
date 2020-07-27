//
//  AppDelegate.swift
//  ModulebankTest
//
//  Created by Savely on 24.03.2020.
//  Copyright © 2020 TEST. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: Coordinatable!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = UINavigationController()
        window?.rootViewController = rootViewController

        appCoordinator = AppCoordinator(navigationController: rootViewController)
        appCoordinator?.start()
        
        window?.makeKeyAndVisible()
 
        return true
    } 
}

