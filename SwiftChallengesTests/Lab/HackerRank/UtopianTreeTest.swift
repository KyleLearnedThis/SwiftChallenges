//
//  UtopianTreeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/24/22.
//

import XCTest

class UtopianTreeTest: XCTestCase {
    func testBasic01() throws {
        let ut = UtopianTree()
        let n = 4
        let expected = 7
        let actual = ut.utopianTree(n: n)
        XCTAssertEqual(expected, actual)
    }
}
