//
//  PivotIndexTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/23/22.
//

import XCTest

class PivotIndexTest: XCTestCase {

    func testBasic01() throws {
        let input = [1,7,3,6,5,6]
        let expected = 3
        let actual = PivotIndex.find(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [1,2,3]
        let expected = -1
        let actual = PivotIndex.find(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() throws {
        let input = [2,1,-1]
        let expected = 0
        let actual = PivotIndex.find(input)
        XCTAssertEqual(expected, actual)
    }
}
