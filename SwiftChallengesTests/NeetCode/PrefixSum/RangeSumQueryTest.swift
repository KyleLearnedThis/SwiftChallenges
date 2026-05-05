//
//  RangeSumQueryTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/4/26.
//

import XCTest

class RangeSumQueryTest: XCTestCase {
    let rsq = RangeSumQuery([-2, 0, 3, -5, 2, -1])

    func testBasicRange() {
        XCTAssertEqual(rsq.sumRange(0, 2), 1)
    }

    func testSingleElement() {
        XCTAssertEqual(rsq.sumRange(2, 2), 3)
    }

    func testFullRange() {
        XCTAssertEqual(rsq.sumRange(0, 5), -3)
    }

    func testRangeWithNegatives() {
        XCTAssertEqual(rsq.sumRange(2, 5), -1)
    }

    func testRangeEndOfArray() {
        XCTAssertEqual(rsq.sumRange(1, 5), -1)
    }

    func testAllZeros() {
        let rsqZeros = RangeSumQuery([0, 0, 0, 0])
        XCTAssertEqual(rsqZeros.sumRange(0, 3), 0)
    }

    func testSingleElementArray() {
        let rsqOne = RangeSumQuery([7])
        XCTAssertEqual(rsqOne.sumRange(0, 0), 7)
    }
}
