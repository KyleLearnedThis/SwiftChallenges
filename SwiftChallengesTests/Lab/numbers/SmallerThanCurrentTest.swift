//
//  SmallerThanCurrentTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/6/22.
//

import XCTest

class SmallerThanCurrentTest: XCTestCase {

    func testBasic01() throws {
        let input = [8,1,2,2,3]
        let expected = [4,0,1,1,3]
        let actual = SmallerThanCurrent.smallerNumbersThanCurrent(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [7,7,7,7]
        let expected = [0,0,0,0]
        let actual = SmallerThanCurrent.smallerNumbersThanCurrent(input)
        XCTAssertEqual(expected, actual)
    }

}
