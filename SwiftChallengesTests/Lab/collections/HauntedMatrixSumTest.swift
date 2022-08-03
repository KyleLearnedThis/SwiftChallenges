//
//  HauntedMatrixSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/3/22.
//

import XCTest

class HauntedMatrixSumTest: XCTestCase {
    func testBasic01() throws {
        let input = [[0, 1, 1, 2],
                     [0, 5, 0, 0],
                     [2, 0, 3, 3]]
        let hm = HauntedMatrixSum()
        let expected = 9
        let actual = hm.matrixElementsSum(matrix: input)
        XCTAssertEqual(expected, actual)
    }
}
