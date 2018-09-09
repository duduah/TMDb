//
//  SearchNavigator.swift
//  TMDbCore
//
//  Created by Diego Gay Saez on 9/9/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final class SearchNavigator {
    private unowned let searchViewControllerProvider: SearchViewControllerProvider
    private var searchController: UISearchController!
    
    init(searchViewControllerProvider: SearchViewControllerProvider) {
        self.searchViewControllerProvider = searchViewControllerProvider
    }
    
    func installSearch(in viewController: UIViewController) {
        let searchViewController = searchViewControllerProvider.searchViewController()
        searchController = UISearchController(searchResultsController: searchViewController)
        
        searchController.searchResultsUpdater = searchViewController as? UISearchResultsUpdating
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search movies, shows or people", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
