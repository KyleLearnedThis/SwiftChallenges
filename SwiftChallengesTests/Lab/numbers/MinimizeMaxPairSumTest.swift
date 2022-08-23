//
//  MinimizeMaxPairSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/23/22.
//

import XCTest

class MinimizeMaxPairSumTest: XCTestCase {
    func testBasic01() {
        let input = [3,5,2,3]
        let expected = 7
        let actual = MinimizeMaxPairSum.minPairSum(input)
        XCTAssertEqual(expected, actual)
    }
}
