//
//  MinimumFourDigitsSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/15/22.
//

import XCTest

final class MinimumFourDigitsSumTest: XCTestCase {
    func testBasic01() {
        let input = 2932
        let expected = 52
        let actual = MinimumFourDigitsSum.minimumSum(input)
        XCTAssertEqual(expected, actual)
    }
}
