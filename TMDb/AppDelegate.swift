//
//  AppDelegate.swift
//  TMDb
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coreAssembly: CoreAssembly?
    let window = UIWindow(frame: UIScreen.main.bounds)


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
        let navigationController = UINavigationController()
        coreAssembly = CoreAssembly(navigationController: navigationController)
        
        // TODO: create FeaturedViewController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
		return true
	}

}

