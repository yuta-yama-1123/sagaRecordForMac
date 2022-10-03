//
//  sagaRecordForMacUITests.swift
//  sagaRecordForMacUITests
//
//  Created by 山本祐太 on 2022/09/13.
//

import XCTest

class sagaRecordForMacUITests: XCTestCase {

  override func setUpWithError() throws {
    super.setUp()
    continueAfterFailure = true
    XCUIApplication().launch()
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
  
  func testEditStatusButton() throws {
    // サインイン
    try testSignin()
    // 画面遷移
    sleep(3)
    let app = XCUIApplication()
    let btn_edit_status = app.buttons["EditStatus"]
    let txt_style_name = app.staticTexts["TargetStyleName"]
    btn_edit_status.tap()

    let testTextStyleName = "test"
    XCTAssertEqual(txt_style_name.value as! String, testTextStyleName)
  }

  func testSignin() throws {
    let app = XCUIApplication()
    let btn_signin = app.buttons["Signin"]
    btn_signin.tap()
  }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
