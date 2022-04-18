//
//  AppDelegate.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let vc = PersonListViewController()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.prefersLargeTitles = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

