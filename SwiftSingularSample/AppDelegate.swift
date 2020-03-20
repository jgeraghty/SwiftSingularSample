//
//  AppDelegate.swift
//  SwiftSingularSample
//
//  Created by Joseph Geraghty on 3/6/20.
//  Copyright © 2020 Joseph Geraghty. All rights reserved.
//

import UIKit
import Singular

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var appState = AppState()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Initialize the Singular SDK
        Singular.startSession(Globals.APIKEY, withKey: Globals.SECRET, withSingularLinkHandler: { params in
            //if the app opens on a deep link, callback is triggered
            //handle the values needed for the app
            self.appState.handleDeepLink(params: params)
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

