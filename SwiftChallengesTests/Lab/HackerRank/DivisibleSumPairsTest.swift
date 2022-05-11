//
//  DivisibleSumPairsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/10/22.
//

import XCTest

class DivisibleSumPairsTest: XCTestCase {
    func testBasic01() throws {
        let input = [1, 3, 2, 6, 1, 2]
        let k = 3
        let expected = 5
        let actual = DivisibleSumPairs.divisibleSumPairs(n: input.count, k: k, ar: input)
        XCTAssertEqual(expected, actual)
    }
}
