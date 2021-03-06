//
//  AppDelegate.swift
//  Mobi
//
//  Created by HeoConUnIn on 9/23/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var intClick: CGFloat = 0.0
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GADMobileAds.configure(withApplicationID: "ca-app-pub-4837358488793511~4185891016")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        UTIL.setUserDefault(byValue: intClick, forKey: clinkNumber)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        // earn money
        intClick = UTIL.getUserDefaultValue(forValue: clinkNumber) as? CGFloat ?? 0.0
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
    }

    func resetToRootViewLogin(onComplete complete: ((Bool) -> ())?) {
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootLoginVC")
        self.window?.setRootViewController(rootVC, fromWindow: self.window!, withTransition: .transitionCrossDissolve, completionHandler: complete)
    }
    
    func resetToRootViewHome(onComplete complete: ((Bool) -> ())?) {
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootVC")
        self.window?.setRootViewController(rootVC, fromWindow: self.window!, withTransition: .transitionCrossDissolve, completionHandler: complete)
    }
}

