//
//  AppDelegate.swift
//  TMDb
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()
    
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
        let initialViewController = appAssembly.coreAssembly.featuredAssembly.viewController()
        appAssembly.rootViewController.pushViewController(initialViewController, animated: false)
        appAssembly.window.rootViewController = appAssembly.rootViewController
        appAssembly.window.makeKeyAndVisible()
        
		return true
	}

}

