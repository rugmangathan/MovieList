//
//  MovieListUITests.swift
//  MovieListUITests
//
//  Created by Captain America on 18/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import XCTest

class MovieListUITests: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testshowDetailView() {
    // UI tests must launch the application that they test.

    let app = XCUIApplication()
    app.launch()
    let tableView: XCUIElement = app.tables["MovieListTableView"]
    XCTAssertTrue(tableView.exists, "Movie table view available")
    let cells = tableView.cells

    if cells.count > 0 {
      let count: Int = cells.count - 1
      let promise = expectation(description: "wait for tableview cells")
      for i in stride(from: 0, to: count, by: 1) {
        let tableCell = cells.element(boundBy: i)
        XCTAssertTrue(tableCell.exists, "The cell exist at index \(i)")
        let cellText = tableCell.staticTexts.element(boundBy: 0).label
        tableCell.tap()
        XCTAssertTrue(app.navigationBars[cellText].exists, "Detail view navigation title available")
        if i == (count - 1) {
            promise.fulfill()
        }
        app.navigationBars[cellText].buttons["MovieDB"].tap()
      }
      waitForExpectations(timeout: 1000.0, handler: nil)
      XCTAssertTrue(true, "Finished validating table view cells")
    } else {
      XCTAssert(false, "was not able to find table view cells")
    }
  }

  func testLaunchPerformance() {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
        XCUIApplication().launch()
      }
    }
  }
}
