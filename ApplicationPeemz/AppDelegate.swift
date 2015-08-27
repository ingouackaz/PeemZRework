//
//  AppDelegate.swift
//  ApplicationPeemz
//
//  Created by David Ghouzi on 19/08/15.
//  Copyright (c) 2015 DGPeemz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        application.statusBarStyle = UIStatusBarStyle.LightContent
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let centerNav = storyboard.instantiateViewControllerWithIdentifier("CenterNav") as! UINavigationController
        let centerVC = centerNav.viewControllers.first as! CenterViewController
        let menuVC = storyboard.instantiateViewControllerWithIdentifier("SideMenu") as! SideMenuViewController
        menuVC.centerViewController = centerNav.viewControllers.first as! CenterViewController
        
        let containerVC = ContainerViewController(sideMenu: menuVC, center: centerNav)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.rootViewController = containerVC
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        
        
//        let nsuserdefault = NSUserDefaults.standardUserDefaults()
//        if nsuserdefault.boolForKey("FirstConnection") {
//            println("Not first launch.")
//        } else {
//            println("first launch.")
//            
//            // On charge le tutoriel
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let secondViewController =  storyboard.instantiateViewControllerWithIdentifier("Tutorial") as! TutorialViewController
//            
//            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//            self.window!.rootViewController = secondViewController
//            self.window!.makeKeyAndVisible()
//            
//            // On précise que ce n'est plus la première connection
//            nsuserdefault.setBool(true, forKey: "FirstConnection")
//        }
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

