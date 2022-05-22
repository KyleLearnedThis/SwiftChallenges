//
//  DaysOfRussianProgrammerTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/22/22.
//

import XCTest

class DaysOfRussianProgrammerTest: XCTestCase {
    func testBasic01() throws {
        let input = 1984
        let expected = "12.09.1984"
        let actual = DaysOfRussianProgrammer.dayOfProgrammer(year: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = 2017
        let expected = "13.09.2017"
        let actual = DaysOfRussianProgrammer.dayOfProgrammer(year: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() throws {
        let input = 2016
        let expected = "12.09.2016"
        let actual = DaysOfRussianProgrammer.dayOfProgrammer(year: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic04() throws {
        let input = 1800
        let expected = "12.09.1800"
        let actual = DaysOfRussianProgrammer.dayOfProgrammer(year: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic05() throws {
        let input = 1918
        let expected = "26.09.1918"
        let actual = DaysOfRussianProgrammer.dayOfProgrammer(year: input)
        XCTAssertEqual(expected, actual)
    }
}
