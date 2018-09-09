//
//  FeaturedViewMock.swift
//  TMDbCoreTests
//
//  Created by Diego Gay Saez on 2/9/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
@testable import TMDbCore

final class FeaturedViewMock: FeaturedView {
    var setShowsHeaderTitleCalls: [String] = []
    var setMoviesHeaderTitleCalls: [String] = []
    var updateWithShowsCalls: [[Show]] = []
    var updateWithMoviesCalls: [[Movie]] = []
    
    func setShowsHeaderTitle(_ title: String) {
        setShowsHeaderTitleCalls.append(title)
    }
    
    func setMoviesHeaderTitle(_ title: String) {
        setMoviesHeaderTitleCalls.append(title)
    }
    
    func update(with shows: [Show]) {
        updateWithShowsCalls.append(shows)
    }
    
    func update(with movies: [Movie]) {
        updateWithMoviesCalls.append(movies)
    }
}
