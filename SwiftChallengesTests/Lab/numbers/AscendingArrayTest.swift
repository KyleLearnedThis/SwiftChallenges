//
//  AscendingArrayTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/8/22.
//

import XCTest

class AscendingArrayTest: XCTestCase {
    func testBasic01() throws {
        let input = [4,2,3]
        let da = AscendingArray()
        let expected = true
        let actual = da.checkPossibility(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [4,2,1]
        let da = AscendingArray()
        let expected = false
        let actual = da.checkPossibility(input)
        XCTAssertEqual(expected, actual)
    }
}
