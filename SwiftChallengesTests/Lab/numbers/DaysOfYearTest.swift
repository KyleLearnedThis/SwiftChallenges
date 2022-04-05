//
//  DaysOfYearTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 1/31/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

/**
 * Problem source: https://leetcode.com/problems/day-of-the-year/
 * Note that no leap year on centennial if it is not divisible by 400
 * Ex: 1900 is not a leap year, 2000 is.
 */
import XCTest

class DaysOfYearTest: XCTestCase {
    func testBasic() throws {
        let input = "2019-01-09"
        let expected = 9
        let actual = DaysOfYear.dayOfYear(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV2() throws {
        let input = "2016-02-09"
        let expected = 40
        let actual = DaysOfYear.dayOfYear(input)
        XCTAssertEqual(expected, actual)
    }

    func testLeapYearV1() throws {
        let input = "2004-03-01"
        let expected = 61
        let actual = DaysOfYear.dayOfYear(input)
        XCTAssertEqual(expected, actual)
    }

    func testLeapYearV2() throws {
        let input = "1900-05-02"
        let expected = 122
        let actual = DaysOfYear.dayOfYear(input)
        XCTAssertEqual(expected, actual)
    }
}
