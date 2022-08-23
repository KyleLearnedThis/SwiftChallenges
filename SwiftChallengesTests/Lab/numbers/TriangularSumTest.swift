//
//  TriangularSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/23/22.
//

import XCTest

class TriangularSumTest: XCTestCase {
    func testBasic01() throws {
        let input = [1,2,3,4,5]
        let expected = 8
        let actual = TriangularSum.sum(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [5]
        let expected = 5
        let actual = TriangularSum.sum(input)
        XCTAssertEqual(expected, actual)
    }
}
