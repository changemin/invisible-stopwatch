//
//  UITests.swift
//  UITests
//
//  Created by 변경민 on 2021/06/08.
//

import XCTest

class UITests: XCTestCase {
    func testGesture() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launchArguments.append("testingGesture")
        app.launch()
        snapshot("gesture")
    }
    func testInvisibleMode() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launchArguments.append("testingInvisibleMode")
        app.launch()
        snapshot("invisible")
    }
    func testDarkMode() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        var launchArguments: [AnyHashable] = []
        launchArguments.append("-AppleInterfaceStyle")
        launchArguments.append("Dark")
        app.launchArguments = launchArguments as! [String]
        app.launch()
        snapshot("darkmode")
    }
}
