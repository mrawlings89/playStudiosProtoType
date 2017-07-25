//
//  AppDelegate.swift
//  playStudiosPrototype
//
//  Created by Michael Rawlings on 7/10/17.
//  Copyright © 2017 Michael Rawlings. All rights reserved.
//

import UIKit
#if DEBUG
    import AdSupport
#endif
import Leanplum

public var liteEventRank = "🦐"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
            Leanplum.setDeviceId(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
            Leanplum.setAppId("app_hO14t5UPQSuPwMwdiRpDIGqxg1FcKmvuDLOUWzvmQmw",
                              withDevelopmentKey:"dev_DAUttjKhkBnPxHI6EOf0KF35LhRwt6PgYsegREBhkhc")
        #else
            Leanplum.setAppId("app_hO14t5UPQSuPwMwdiRpDIGqxg1FcKmvuDLOUWzvmQmw",
                              withProductionKey: "prod_wtvatavNJIgFNUR4g5Lx6AW2GDqk9Dv4ePLpokj0xMo")
        #endif
     
        Leanplum.start()
        
        Leanplum.setUserId("trawlings88")
        Leanplum.setUserAttributes(["firstName": "Teddy", "liteEventRank" : liteEventRank, "myGroup" : "groupNotSet"])
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        Leanplum.forceContentUpdate() 

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

