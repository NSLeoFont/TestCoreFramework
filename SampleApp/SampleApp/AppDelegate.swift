//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Leo Font on 17/08/2020.
//  Copyright © 2020 Leo Font. All rights reserved.
//

import UIKit
import TestCoreFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let color = TestCoreFramework.Color.frameworkColor
        let secondaryColor = TestCoreFramework.Color.secondaryFrameworkColor
        
        let url = URL(string: "https://www.apple.com")!
        let manager = TestCoreFramework.Networking.Manager()
        manager.loadData(from: url, completion: { result in
            print(result)
        })
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

