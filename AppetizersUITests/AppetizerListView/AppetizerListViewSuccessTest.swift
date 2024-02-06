//
//  AppetizerListViewTest.swift
//  AppetizersUITests
//
//  Created by Tharin Zaman on 30/01/2024.
//

import XCTest
@testable import Appetizers

final class AppetizerListViewSuccessTest: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var list: XCUIElement!
    private var listItems: XCUIElementQuery!
    private var detailView: XCUIElement!
    
    override func setUp() {
        continueAfterFailure = true
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success":"1"]
        app.launch()
        
        list = app.collectionViews["appetizer-list"]
        let listItemsPredicate = NSPredicate(format: "identifier CONTAINS 'item_'")
        listItems = list.descendants(matching: .any).containing(listItemsPredicate)
        detailView = app.descendants(matching: .any)["detail-view"]
    }
    
    override func tearDown() {
        app = nil
        list = nil
        listItems = nil
        detailView = nil
    }
    
    func test_listContains14Items_tapItemShowDetailView_success() {
        XCTAssertTrue(list.waitForExistence(timeout: 5))
        XCTAssertEqual(listItems.count, 14)
    }
    
    func test_tapAppetizerShowDetail() {
        listItems.firstMatch.tap()
        XCTAssertTrue(detailView.exists)
    }
    
    func test_tapAddToOrderButton_closeDetailView() {
        listItems.firstMatch.tap()
        let addToOrderButton = app.buttons["add-to-order-button"]
        addToOrderButton.tap()
        XCTAssertFalse(detailView.exists)
        XCTAssertTrue(list.exists)
    }

}

