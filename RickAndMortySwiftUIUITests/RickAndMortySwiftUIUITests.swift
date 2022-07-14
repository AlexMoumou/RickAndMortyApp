//
//  RickAndMortySwiftUIUITests.swift
//  RickAndMortySwiftUIUITests
//
//  Created by Alex Moumoulides on 30/12/21.
//

import XCTest

class RickAndMortySwiftUIUITests: XCTestCase {

    override func setUpWithError() throws {
        XCUIDevice.shared.orientation = .portrait

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOpenCloseCharacterDetails() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        XCTAssert(app.staticTexts["Rick and Morty"].exists)
        app.scrollViews.otherElements.buttons["Rick Sanchez, Alive - Human, Last known location:, Citadel of Ricks"].tap()
        XCTAssert(app.staticTexts["Rick Sanchez"].exists)
        app.navigationBars["Rick Sanchez"].buttons["Rick and Morty"].tap()
        
    }
}
