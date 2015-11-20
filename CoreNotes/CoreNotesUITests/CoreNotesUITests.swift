//
//  CoreNotesUITests.swift
//  CoreNotesUITests
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import XCTest

@testable import CoreNotes

class CoreNotesUITests: XCTestCase {
        
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
    
    
    func testSwipe() {
        XCUIDevice.sharedDevice().orientation = .FaceUp
        
        let app = XCUIApplication()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."].tap()
        
        tablesQuery.buttons["Delete"].tap()
        
    }
    
    func testCreateNote() {
        
        XCUIDevice.sharedDevice().orientation = .FaceUp
        
        let app = XCUIApplication()
        app.navigationBars["CoreNotes.NotesTableView"].buttons["Organize"].tap()
        
        let pickerWheel = app.pickerWheels["1 of 4"]
        pickerWheel.tap()
        
        let pickerWheel2 = app.pickerWheels["2 of 4"]
        pickerWheel2.tap()
        
        let pickerWheel3 = app.pickerWheels["3 of 4"]
        pickerWheel3.tap()
        
        let pickerWheel4 = app.pickerWheels["4 of 4"]
        pickerWheel4.tap()
        pickerWheel4.tap()
        pickerWheel3.tap()
        pickerWheel2.tap()
        
        let categoryNameTextField = app.textFields["Category Name"]
        categoryNameTextField.tap()
        categoryNameTextField.typeText("new")
        app.buttons["Return"].tap()
        app.typeText("\n")
        pickerWheel.tap()
        pickerWheel3.tap()
        pickerWheel4.tap()
        pickerWheel.tap()
        app.buttons["Create"].tap()
        
        
    }
//    func testExample() {
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        
//        let tablesQuery = XCUIApplication.tables
//        
//        let cellCount = tablesQuery.childrenMatchingType(.Cell).count
//        
//        for _ in 0..<cellCount {
//            tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["Note"].swipeLeft()
//            
//            tablesQuery.buttons["Delete"].tap()
//        }
//        
//        
//    }
    
}
