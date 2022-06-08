//
//  TwoSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/14/22.
//

import XCTest

class TwoSumTest: XCTestCase {
    func testBasic01() throws {
        let input = [2,7,11,15]
        let target = 9
        let actual = TwoSum.twoSum(input, target)
        let expected = [0,1]
        XCTAssertEqual(expected, actual)
    }

    func testSumsBasic01() throws {
        let input = [3,6,2,7,11,15, -2]
        let target = 9
        let actual = TwoSum.twoSums(input, target)
        let expected = [[0,1], [2,3], [4,6]]

        for i in actual.indices {
            let a1 = actual[i]
            let e1 = expected[i]
            XCTAssertEqual(a1, e1)
        }
    }
}
