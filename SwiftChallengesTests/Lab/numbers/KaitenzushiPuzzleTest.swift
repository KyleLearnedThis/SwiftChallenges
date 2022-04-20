//
//  KaitenzushiPuzzleTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/20/22.
//

import XCTest

class KaitenzushiPuzzleTest: XCTestCase {

    func testBasicV01() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 2
        let expected = 4
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV1(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 1
        let expected = 5
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV1(n, input, k)
        XCTAssertEqual(expected, actual)
    }
}
