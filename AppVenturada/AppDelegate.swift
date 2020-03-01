//
//  AppDelegate.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    /*
    AppDelegate
    Tiene el codigo que se ejecuta cuando la app comienza a ejecutar
    -  didFinishLaunchingWithOptions: se ejecuta antes de mostrar el primer view controller
    -  applicationWillResignActive: cuando hay interrupciones como llamadas, SMS, ...
    -  applicationDidEnterBackground: cuando la app va a entrar en background
    -  applicationWillEnterForeground: cuando la app va a entrar en primer plano
    */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("Mostrando la interfaz...")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Pasando a background...")
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

