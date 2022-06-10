//
//  UniqueDigitsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/22.
//

import XCTest

class UniqueDigitsTest: XCTestCase {
    func testBasicV1_01() throws {
        let expected = [10,12,13,14,15,16,17,18,19,20]
        let ud = UniqueDigits()
        let actual = ud.range(low: 10, high: 20)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV2_01() throws {
        let expected = [10,12,13,14,15,16,17,18,19,20]
        let ud = UniqueDigits()
        let actual = ud.rangeV2(low: 10, high: 20)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV3_01() throws {
        let ud = UniqueDigits()
        let n = 2
        let expected = 91
        let actual = ud.countNumbersWithUniqueDigits(n)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV3_02() throws {
        let ud = UniqueDigits()
        let n = 0
        let expected = 1
        let actual = ud.countNumbersWithUniqueDigits(n)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV3_03() throws {
        let ud = UniqueDigits()
        let n = 1
        let expected = 10
        let actual = ud.countNumbersWithUniqueDigits(n)
        XCTAssertEqual(expected, actual)
    }
}
