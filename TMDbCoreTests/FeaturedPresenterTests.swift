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
    private let featuredViewMock = FeaturedViewMock()
    
    override func setUp() {
        super.setUp()
        
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock)
        sut.view = featuredViewMock
    }
    
    // Tests names = given + when + then
    
    /**
     testPresenterDidSelectShowNavigatesToShow:
     given = Show
     when = didSelectShow
     then = navigatesToShow
     */
    
    func test_didLoad_setHeaderTitles() {
        // when
        sut.didLoad()
        
        // then
        XCTAssertEqual(featuredViewMock.setShowsHeaderTitleCalls.count, 1)
        XCTAssertEqual(featuredViewMock.setShowsHeaderTitleCalls.first, NSLocalizedString("ON TV", comment: ""))
        XCTAssertEqual(featuredViewMock.setMoviesHeaderTitleCalls.count, 1)
        XCTAssertEqual(featuredViewMock.setMoviesHeaderTitleCalls.first, NSLocalizedString("IN THEATERS", comment: ""))
    }
    
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
    
    func testMovie_didSelectMovie_navigatesToShow() {
        // given
        let movie = Movie(identifier: 30,
                          title: "Movie test",
                          posterPath: nil,
                          backdropPath: nil,
                          releaseDate: nil,
                          genreIdentifiers: [])
        
        // when
        sut.didSelect(movie: movie)
        
        // then
        XCTAssertEqual(detailNavigatorMock.navigateToMovieCalls.count, 1)
        XCTAssertEqual(detailNavigatorMock.navigateToMovieCalls.first, movie.identifier)
    }
}
