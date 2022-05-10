//
//  MilitaryTimeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/10/22.
//

import XCTest

class MilitaryTimeTest: XCTestCase {
    func testBasic01() throws {
        let input = "07:05:45PM"
        let expected = "19:05:45"
        let actual = MilitaryTime.timeConversion(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = "11:59:59AM"
        let expected = "11:59:59"
        let actual = MilitaryTime.timeConversion(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() throws {
        let input = "11:59:59PM"
        let expected = "23:59:59"
        let actual = MilitaryTime.timeConversion(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic04() throws {
        let input = "12:01:00AM"
        let expected = "00:01:00"
        let actual = MilitaryTime.timeConversion(s: input)
        XCTAssertEqual(expected, actual)
    }
}
