//
//  UpcomingMoviesUITests.swift
//  UpcomingMoviesUITests
//
//  Created by Adriano Song on 30/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import XCTest

class UpcomingMoviesUITests: XCTestCase {
    
    let thePredatorReleaseDate = "Release date: Sep 13, 2018"
    let thePredatorGenres = "Genre: Horror, Science Fiction, Action, Comedy"
    
    let rio2Genres = "Genre: Adventure, Comedy, Family, Music, Animation"
    let rio2ReleaseDate = "Release date: Mar 19, 2014"
    
    let scrolledMovie = "Rio 2"
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUpcomingMovieThePredator() {
        // Use recording to get started writing UI tests.
        let app = XCUIApplication()
        
        app.tables.staticTexts["The Predator"].tap()
        app.otherElements.containing(.navigationBar, identifier:"The Predator").children(matching: .other).element(boundBy: 0).staticTexts["The Predator"].tap()
        
        XCTAssertEqual(app.staticTexts["Release date: Sep 13, 2018"].label, thePredatorReleaseDate)
        XCTAssertEqual(app.staticTexts["Genre: Horror, Science Fiction, Action, Comedy"].label, thePredatorGenres)
        app.navigationBars["The Predator"].buttons["Upcoming Movies"].tap()
    }
    
    func testUpcomingMovieInfinityScrollRio2() {
        
        let app = XCUIApplication()
        
        app.swipeDown()
        
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        
        XCTAssertEqual(app.staticTexts["Rio 2"].label, scrolledMovie)
        
        app.tables.staticTexts["Rio 2"].tap()
        
        XCTAssertEqual(app.staticTexts["Genre: Adventure, Comedy, Family, Music, Animation"].label, rio2Genres)
         XCTAssertEqual(app.staticTexts["Release date: Mar 19, 2014"].label, rio2ReleaseDate) 
        
        app.navigationBars["Rio 2"].buttons["Upcoming Movies"].tap()
    }
}
