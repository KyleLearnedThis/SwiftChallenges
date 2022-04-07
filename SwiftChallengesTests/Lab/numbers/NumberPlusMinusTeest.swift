//
//  NumberPlusMinusTeest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/7/22.
//

import XCTest

class NumberPlusMinusTeest: XCTestCase {

    func testBasic01() throws {
        let input = [1,1,0,-1,-1]
        let expected: [Float] = [0.40000, 0.40000, 0.20000]
        let actual = NumberPlusMinus.plusMinus(arr: input)
        XCTAssertTrue(expected.count == actual.count)
        for i in actual.indices {
            XCTAssertEqual(expected[i], actual[i], accuracy: 0.0001)
        }
    }

}
