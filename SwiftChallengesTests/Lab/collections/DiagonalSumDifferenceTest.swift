//
//  DiagonalSumDifferenceTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/6/22.
//

import XCTest

class DiagonalSumDifferenceTest: XCTestCase {
    func testBasic01() throws {
        let input = [[1,2,3],[4,5,6],[9,8,9]]
        let expected = 2
        let actual = DiagonalSumDifference.differences(arr: input)
        XCTAssertEqual(expected, actual)
    }
}
