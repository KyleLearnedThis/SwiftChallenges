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
}
