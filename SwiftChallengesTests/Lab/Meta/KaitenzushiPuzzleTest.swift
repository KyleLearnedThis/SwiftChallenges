//
//  KaitenzushiPuzzleTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/20/22.
//

import XCTest

class KaitenzushiPuzzleTest: XCTestCase {
    func testBasicV01_01() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 1
        let expected = 5
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV1(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV01_02() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 2
        let expected = 4
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV1(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV01_03() throws {
        let input = [1, 2, 1, 2, 1, 2, 1]
        let n = input.count
        let k = 2
        let expected = 2
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV1(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_01() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 1
        let expected = 5
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV2(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_02() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 2
        let expected = 4
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV2(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02_03() throws {
        let input = [1, 2, 1, 2, 1, 2, 1]
        let n = input.count
        let k = 2
        let expected = 2
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV2(n, input, k)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV03_01() throws {
        let input = [1, 2, 3, 3, 2, 1]
        let n = input.count
        let k = 1
        let expected = 5
        let actual = KaitenzushiPuzzle.getMaximumEatenDishCountV3(n, input, k)
        XCTAssertEqual(expected, actual)
    }
}
