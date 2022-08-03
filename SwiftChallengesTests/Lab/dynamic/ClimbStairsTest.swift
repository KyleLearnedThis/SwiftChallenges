//
//  ClimbStairsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/2/22.
//

import XCTest

class ClimbStairsTest: XCTestCase {
    func testBasic01() throws {
        let input = 3
        let expected = 3
        let cs = ClimbStairs()
        let actual = cs.climbStairs(input)
        XCTAssertEqual(expected, actual)
    }
}
