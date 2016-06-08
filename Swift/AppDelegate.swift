//
//  AppDelegate.swift
//  Swift
//
//  Created by 朱佩 on 16/6/7.
//  Copyright © 2016年 朱佩. All rights reserved.
//

import UIKit
import QorumLogs
import MBProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        QorumLogs.enabled = true
        QorumOnlineLogs.enabled = true
        QorumLogs.minimumLogLevelShown = 2
        QorumOnlineLogs.minimumLogLevelShown = 4
        
        QorumLogs.colorsForLogLevels[0] = QLColor(r: 255, g: 125, b: 0)
        QorumLogs.colorsForLogLevels[1] = QLColor(r: 255, g: 20, b: 147)
        
        let hub:MBProgressHUD = MBProgressHUD.init();
        hub.labelText = "加载中..."
        hub.show(true)
        
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
        
        //change the attributes of tabitem
        
        let cgfloat:CGFloat = 12
        let font:UIFont = UIFont.init(name: "Helvetica", size: cgfloat)!
        
        let cgSize:CGSize = CGSize.init(width: 50, height: 50)
        
        let shadow:NSShadow = NSShadow.init()
        
        shadow.shadowOffset = cgSize
        
        let tabItemAttributes = [
            NSForegroundColorAttributeName : UIColor.brownColor(),//change the font color
            
            NSFontAttributeName:font, //change the font size
            
            NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
            NSBackgroundColorAttributeName : UIColor.blueColor(),
            NSStrokeWidthAttributeName : 50,
            NSStrokeColorAttributeName : UIColor.darkGrayColor(),
            NSUnderlineStyleAttributeName : 1,
            //NSShadowAttributeName :shadow
            
            ]
        
        // set the color of the tabbaritem text as selected
        controllerOne.tabBarItem.setTitleTextAttributes(tabItemAttributes, forState: .Selected)
        // set the color of the tabbaritem text as normal
        controllerOne.tabBarItem.setTitleTextAttributes(tabItemAttributes, forState: .Normal)
        

        
        controllerOne.tabBarItem.badgeValue = "11+"
        
        
        
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
        QL1("1.application will resign active.")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
         QL2("2.application did enter background.")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        QL3("3.application will enter foreground.")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        QL4("4.application did become active.")
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        QL4("5.application will terminate.")
    }


}

