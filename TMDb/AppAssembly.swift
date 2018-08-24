//
//  AppAssembly.swift
//  TMDb
//
//  Created by Diego Gay Saez on 24/8/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private lazy var rootViewController = UINavigationController()
    private lazy var coreAssembly = CoreAssembly(navigationController: rootViewController)
    
    func setupRootViewController() {

        let initialViewController = coreAssembly.featuredAssembly.viewController()
        rootViewController.pushViewController(initialViewController,
                                              animated: false)
        window.rootViewController = rootViewController
    }
}

