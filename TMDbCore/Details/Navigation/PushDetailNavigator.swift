//
//  PushDetailNavigator.swift
//  TMDbCore
//
//  Created by Diego Gay Saez on 31/8/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PushDetailNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension PushDetailNavigator: DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64) {
        let detailViewController = 
    }
    
    func navigateToMovie(withIdentifier identifier: Int64) {
        <#code#>
    }
}
