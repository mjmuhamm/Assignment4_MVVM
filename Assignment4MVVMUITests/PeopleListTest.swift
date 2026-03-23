//
//  PeopleListTest.swift
//  Assignment4MVVMUITests
//
//  Created by Malik Muhammad on 3/23/26.
//

import XCTest

final class PeopleListTest: XCTestCase {

    var app : XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        app = XCUIApplication()
        app.launch()
        app.launchArguments = ["UITestMockSuccess"]
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testPersonListScreenTitle() {
        //Tests if List exists
        let list = app.descendants(matching: .any)["people_list"]
        XCTAssertTrue(list.waitForExistence(timeout: 5))
        
        //Tests if Lists generates Cell 1
        let cell = app.descendants(matching: .any)["people_cell_1"]
        XCTAssertTrue(cell.exists)
        
        //Tests if title of List exists
        let text = app.staticTexts["person_list_title"]
        XCTAssertTrue(text.waitForExistence(timeout: 5))
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
