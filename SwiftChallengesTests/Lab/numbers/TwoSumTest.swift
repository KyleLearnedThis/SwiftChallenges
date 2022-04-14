//
//  TwoSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/14/22.
//

import XCTest

class TwoSumTest: XCTestCase {
    func testBasic() throws {
        let input = [2,7,11,15]
        let target = 9
        let actual = TwoSum.twoSum(input, target)
        let expected = [0,1]
        XCTAssertEqual(expected, actual)
    }
}
