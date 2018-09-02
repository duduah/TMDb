//
//  FeaturedPresenterTests.swift
//  TMDbCoreTests
//
//  Created by Diego Gay Saez on 2/9/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

class FeaturedPresenterTests: XCTestCase {
    // sut = System Under Test
    private var sut: FeaturedPresenter!
    
    // Collaborators
    private let detailNavigatorMock = DetailNavigatorMock()
    
    override func setUp() {
        super.setUp()
        
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock)
    }
    
    // Tests names = given + when + then
    
    /**
     testPresenterDidSelectShowNavigatesToShow:
     given = Show
     when = didSelectShow
     then = navigatesToShow
     */
    func testShow_didSelectShow_navigatesToShow() {
        // given
        let show = Show(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        firstAirDate: nil,
                        genreIdentifiers: [])
        
        // when
        sut.didSelect(show: show)
        
        // then
        XCTAssertEqual(detailNavigatorMock.navigateToShowCalls.count, 1)
        XCTAssertEqual(detailNavigatorMock.navigateToShowCalls.first, show.identifier)
    }
}
