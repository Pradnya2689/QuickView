//
//  AppDelegate.swift
//  Examples
//
//  Created by ischuetz on 08/05/15.
//  Copyright (c) 2015 ivanschuetz. All rights reserved.
//

import UIKit
import  Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate{
    var loadSecondSet : Bool! = false
    var window: UIWindow?
    let tabs = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        let types: UIUserNotificationType = [UIUserNotificationType.badge ,
                                             UIUserNotificationType.alert,
                                             UIUserNotificationType.sound]
        
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: types, categories: nil)
    
        application.registerUserNotificationSettings(settings)
         application.registerForRemoteNotifications()

        FIRApp.configure()
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            
//            let splitViewController = self.window!.rootViewController as! UISplitViewController
//            let navigationController = splitViewController.viewControllers.last as! UINavigationController
//            splitViewController.delegate = self
//            
//            if #available(iOS 8.0, *) {
//                navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
//            }
//        }
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        //let nav1 = UINavigationController()
      
        let first = UIStoryboard(name: "Main_iPhone", bundle: nil).instantiateViewController(withIdentifier: "barChart") as! BarChartTestViewController
//        
        let nav = UINavigationController.init(rootViewController: first)
//        
        let second = UIStoryboard(name: "Main_iPhone", bundle: nil).instantiateViewController(withIdentifier: "piechart") as! PieChartTestViewController
         let nav1 = UINavigationController.init(rootViewController: second)
//        
        let third = UIStoryboard(name: "Main_iPhone", bundle: nil).instantiateViewController(withIdentifier: "linechart") as! LineChartTestViewController
        let nav2 = UINavigationController.init(rootViewController: third)
        
//        let first = BarChartTestViewController(nibName: "BarChartTestViewController", bundle: nil)
//        let second = PieChartTestViewController(nibName: "PieChartTestViewController", bundle: nil)
//        let third = LineChartTestViewController(nibName: "LineChartTestViewController", bundle: nil)

      // tabs.
       let controllers = [nav,nav1,nav2]
        tabs.viewControllers = controllers
        //tabs.delegate = self
        //tabs.selectedIndex = 0
       let  tabBar = tabs.tabBar
        
        let tabBarItem1 = tabBar.items?[0]
        let tabBarItem2 = tabBar.items?[1]
        let tabBarItem3 = tabBar.items?[2]
        
        tabBarItem1?.title = "PROD CLASS"
        tabBarItem1?.image=UIImage(named: "disableBarImg")?.withRenderingMode(.alwaysOriginal)
        tabBarItem1?.selectedImage=UIImage(named: "barImage")?.withRenderingMode(.alwaysOriginal)
        tabBarItem2?.title = "LOB VOLUME"
        tabBarItem2?.image=UIImage(named: "diablePieImg")?.withRenderingMode(.alwaysOriginal)
        tabBarItem2?.selectedImage=UIImage(named: "pieImage")?.withRenderingMode(.alwaysOriginal)
        tabBarItem3?.title = "OVERALL TREND"
        tabBarItem3?.image=UIImage(named: "disableLineImg")?.withRenderingMode(.alwaysOriginal)
        tabBarItem3?.selectedImage=UIImage(named: "lineImage")?.withRenderingMode(.alwaysOriginal)
        
        
        tabs.tabBar.barTintColor = UIColor(red: 226.0/255.0, green: 0.0/255.0, blue: 116.0/255.0, alpha: 1.0)
        
        let tabBarItemApperance = UITabBarItem.appearance()
        tabBarItemApperance.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white], for: UIControlState.selected)
        tabBarItemApperance.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 188.0/255.0, green: 188.0/255.0, blue: 188.0/255.0, alpha: 1.0)], for: UIControlState.normal)
        
        self.window!.rootViewController = tabs;
        self.window?.makeKeyAndVisible();
        
        return true

    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        
        
        var token = ""
        for i in 0..<deviceToken.count {
            token = token + String(format: "%02.2hhx", arguments: [deviceToken[i]])
        }
        print(token)
        UserDefaults.standard.set(token, forKey: "token")
        
       
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // Print message ID.
        if let messageID = userInfo["AIzaSyDnRpKg2STuScgcjow6WMAktUMM48QFdXE"] {
            print("Message ID: \(messageID)")
        }
        if(loadSecondSet == true){
            loadSecondSet = false
        }else{
            loadSecondSet = true
        }
        var tabbar = self.window?.rootViewController as! UITabBarController
        tabbar.selectedIndex = 0
        // Print full message.
        print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // Print message ID.
        if let messageID = userInfo["AIzaSyDnRpKg2STuScgcjow6WMAktUMM48QFdXE"] {
            print("Message ID: \(messageID)")
        }
       
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
        if(loadSecondSet == true){
            loadSecondSet = false
        }else{
            loadSecondSet = true
        }
        var tabbar = self.window?.rootViewController as! UITabBarController
        tabbar.selectedIndex = 0
//        UITabBarController *tabController = (UITabBarController*)self.window.rootViewController;
//        tabController.selectedIndex = selectedTabIndex;
//        self.window!.rootViewController = tabs;
//        self.window?.makeKeyAndVisible();
        // Print full message.
       // tabs.selectedIndex = 0
     
        
        
    }
    

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        if let secondaryAsNavController = secondaryViewController as? UINavigationController {
            if let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController {
                if topAsDetailController.detailItem == nil {
                    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
                    return true
                }
            }
        }
        return false
    }
    
    fileprivate func setSplitSwipeEnabled(_ enabled: Bool) {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            let splitViewController = UIApplication.shared.delegate?.window!!.rootViewController as! UISplitViewController
            splitViewController.presentsWithGesture = enabled
        }
    }
    
    func splitViewController(_ svc: UISplitViewController, willHide aViewController: UIViewController, with barButtonItem: UIBarButtonItem, for pc: UIPopoverController) {
        
        let navigationController = svc.viewControllers[svc.viewControllers.count-1] as! UINavigationController
        if let topAsDetailController = navigationController.topViewController as? DetailViewController {
                barButtonItem.title = "Examples"
                topAsDetailController.navigationItem.setLeftBarButton(barButtonItem, animated: true)
        }
    }
}


// src: http://stackoverflow.com/a/27399688/930450
extension UISplitViewController {
    func toggleMasterView() {
        if #available(iOS 8.0, *) {
            let barButtonItem = self.displayModeButtonItem
            UIApplication.shared.sendAction(barButtonItem.action!, to: barButtonItem.target, from: nil, for: nil)
        }
    }
}
