//
//  ArrayChangeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/4/22.
//

import XCTest

class ArrayChangeTest: XCTestCase {
    func testBasic01() throws {
        let input = [-1000, 0, -2, 0]
        let expected = 5
        let actual = ArrayChange.calcuateMoves(inputArray: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [2, 1, 10, 1]
        let expected = 12
        let actual = ArrayChange.calcuateMoves(inputArray: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() throws {
        let input = [3122, -645, 2616, 13213, -8069]
        let expected = 25559
        let actual = ArrayChange.calcuateMoves(inputArray: input)
        XCTAssertEqual(expected, actual)
    }
}
