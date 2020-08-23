//
//  AppDelegate.swift
//  IconApp
//
//  Created by Brena Amorim on 14/08/20.
//  Copyright © 2020 Brena Amorim. All rights reserved.
//

import UIKit
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureForTests()

//        window = UIWindow(frame: UIScreen.main.bounds)        
//        let navigationController = UINavigationController(rootViewController: TabBarViewController())
//        navigationController.navigationBar.barTintColor = .primaryColor
//        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.titleColor ?? UIColor.black]
//        navigationController.navigationBar.tintColor = UIColor.actionColor
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//        
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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      if url.host == "oauth-callback" {
        OAuthSwift.handle(url: url)
      }
      return true
    }
    
    private func configureForTests() {
        if CommandLine.arguments.contains("-reset") {
            let defaultsName = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: defaultsName)
        }
    }

}
