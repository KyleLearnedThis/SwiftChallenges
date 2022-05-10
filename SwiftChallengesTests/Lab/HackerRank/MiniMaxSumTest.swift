//
//  MiniMaxSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/10/22.
//

import XCTest

class MiniMaxSumTest: XCTestCase {

    func testBasic01() throws {
        let input = [1,2,3,4,5]
        let expected = [10,14]
        let actual = MinMaxSum.bothSum(arr: input)
        XCTAssertEqual(actual, expected)
    }

    func testBasic02() throws {
        let input = [5,5,5,5,5]
        let expected = [20,20]
        let actual = MinMaxSum.bothSum(arr: input)
        XCTAssertEqual(actual, expected)
    }
}
