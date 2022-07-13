//
//  StickCutTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/13/22.
//

import XCTest

class StickCutTest: XCTestCase {
    func testBasic01() throws {
        let input = [5,4,4,2,2,8]
        let expected = [6,4,2,1]
        let actual = StickCut.cutTheSticks(arr: input)
        XCTAssertEqual(expected, actual)
    }
}
