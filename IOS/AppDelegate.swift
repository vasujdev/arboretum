//
//  AppDelegate.swift
//  IOS
//
//  Created by Dhanekula,Dinesh Kumar on 6/22/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import GoogleMaps
import SystemConfiguration

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var uploadImageSample: Photo_ViewController!
    var window: UIWindow?

    var TreeListArray:NSArray!
    var obj1: DetailtreeinfoViewController!
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("networkStatusChanged:"), name: ReachabilityStatusChangedNotification, object: nil)
        //Reach().monitorReachabilityChanges()
        

        func networkStatusChanged(notification: NSNotification) {
            let userInfo = notification.userInfo
            
            print(userInfo)
            
        }
        func LaunchCondition()
        {
            GMSServices.provideAPIKey("AIzaSyBQf-V2K8LgS4R2i8N6X3xdwqMWKRt8aTY")
            
            let pageController=UIPageControl.appearance()
            //let pagecont=UIPageControl.
            pageController.pageIndicatorTintColor = UIColor.whiteColor()
            pageController.currentPageIndicatorTintColor = UIColor(red: 0, green: 128/255, blue: 128/255, alpha: 1)
        }
        
        func dataOfJson(url: String) {
            let data = NSData(contentsOfURL: NSURL(string: url)!)
            
            TreeListArray = try!(NSJSONSerialization.JSONObjectWithData(data!, options:[]))as! NSArray
        }
        
        let status = Reach().connectionStatus()
        switch status {
        case .Unknown, .Offline:
            print("Not connected")
                    
        case .Online(.WWAN):
            print("Connected via WWAN")
            LaunchCondition()
            dataOfJson("http://csgrad10.nwmissouri.edu/arboretum/treetable.php")
        case .Online(.WiFi):
            print("Connected via WiFi")
            LaunchCondition()
            dataOfJson("http://csgrad10.nwmissouri.edu/arboretum/treetable.php")
        }
    

       
        
        
       
        
       
        
        

        
        // Override point for customization after application launch.
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
