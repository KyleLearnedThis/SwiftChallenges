//
//  CircularArrayQueryTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/25/22.
//

import XCTest

class CircularArrayQueryTest: XCTestCase {
    func testBasic01() throws {
        let caq = CircularArrayQuery()
        let a = [1,2,3]
        let k = 2
        let queries = [0,1,2]
        let expected = [2,3,1]
        let actual = caq.circularArrayRotation(a: a, k: k, queries: queries)
        XCTAssertEqual(expected, actual)
    }
}
