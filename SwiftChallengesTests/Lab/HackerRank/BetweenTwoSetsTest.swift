//
//  BetweenTwoSetsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/22/22.
//

import XCTest

class BetweenTwoSetsTest: XCTestCase {
    func testBasic01() throws {
        let bts = BetweenTwoSets()
        let a = [2,6]
        let b = [24, 36]
        let expected = 2
        let actual = bts.getTotalX(a: a, b: b)
        XCTAssertEqual(expected, actual)
    }
}
