//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Diego Gay Saez on 31/8/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64)
    func navigateToMovie(withIdentifier identifier: Int64)
}
