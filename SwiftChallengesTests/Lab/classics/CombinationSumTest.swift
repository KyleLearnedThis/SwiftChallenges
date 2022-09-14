//
//  CombinationSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/14/22.
//

import XCTest

final class CombinationSumTest: XCTestCase {
    private let cs = CombinationSum()

    func testBasic01() {
        let input = [2,3,6,7]
        let target = 7
        let expected = [[2,2,3],[7]]
        let actual = cs.combinationSum(input, target)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() {
        let input = [2,3,5]
        let target = 8
        let expected = [[2,2,2,2],[2,3,3],[3,5]]
        let actual = cs.combinationSum(input, target)
        XCTAssertEqual(expected, actual)
    }
}
