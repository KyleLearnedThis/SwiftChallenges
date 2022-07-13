//
//  RobotOriginTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/13/22.
//

import XCTest

class RobotOriginTest: XCTestCase {
    func testBasic01() throws {
        let input = "UD"
        let expected = true
        let actual = RobotOrigin.judgeCircle(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = "LL"
        let expected = false
        let actual = RobotOrigin.judgeCircle(input)
        XCTAssertEqual(expected, actual)
    }
}
