//
//  AppDelegate.swift
//  Swift
//
//  Created by 朱佩 on 16/6/7.
//  Copyright © 2016年 朱佩. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //1.create the top window
        
        let mainScreen = UIScreen.mainScreen();
        let screenBounds = mainScreen.bounds
        self.window = UIWindow.init(frame: screenBounds)
        
        //a. init one tab bar controller
        let tb:UITabBarController = UITabBarController()
        self.window?.rootViewController = tb
        
        
        //b. create sub controllers
        
        let controllerOne  = HomeUIViewController.init() //UIViewController.init()
        controllerOne.view.backgroundColor = UIColor.greenColor()
        controllerOne.tabBarItem.title = "测试"
        
        controllerOne.tabBarItem.selectedImage = UIImage.init(named: "skin_test_selected_image")?.imageWithRenderingMode(.AlwaysOriginal)
        
        controllerOne.tabBarItem.image = UIImage.init(named: "skin_test_unselected_image")?.imageWithRenderingMode(.AlwaysOriginal)
        
        // set the color of the tabbaritem text as selected
        controllerOne.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.brownColor()], forState: .Selected)
        // set the color of the tabbaritem text as normal
        controllerOne.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor()], forState: .Normal)
        controllerOne.tabBarItem.badgeValue = "99+"
        
        
        
        let controllerTwo  = UIViewController.init()
        controllerTwo.view.backgroundColor = UIColor.brownColor()
        controllerTwo.tabBarItem.title = "联系人"
        controllerTwo.tabBarItem.image = UIImage.init(named: "skin_test_unselected_image")
        
        
        let controllerThree  = UIViewController.init()
        controllerThree.view.backgroundColor = UIColor.grayColor()
        controllerThree.tabBarItem.title = "动态"
        controllerThree.tabBarItem.image = UIImage.init(named: "skin_test_unselected_image")
        
        let controllerFour  = UIViewController.init()
        controllerFour.view.backgroundColor = UIColor.darkGrayColor()
        controllerFour.tabBarItem.title = "设置"
        controllerFour.tabBarItem.image = UIImage.init(named: "skin_test_unselected_image")
        
        //c. add sub controller to main TabBarController
        
        tb.viewControllers = [controllerOne,controllerTwo,controllerThree,controllerFour]
        
        //d. set the main window and show 
        
        //self.window?.makeKeyAndVisible()
        window?.makeKeyAndVisible()
        

        
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

