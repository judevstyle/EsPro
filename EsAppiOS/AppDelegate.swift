//
//  AppDelegate.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/26/21.
//

import UIKit

//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static let shareDelegate = AppDelegate()
    public var SALECODE = ""
    public var USERNAME = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //MARK: - Navigation
        let attrs = [
            NSAttributedString.Key.font: UIFont.Primary(size: 23)
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        let loadingStoryBoard = "Splash"
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

