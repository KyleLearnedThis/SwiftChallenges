//
//  ChocobarSegmentTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/10/22.
//

import XCTest

class ChocobarSegmentTest: XCTestCase {
    func testBasic01() throws {
        let input = [1,2,1,3,2]
        let d = 3
        let m = 2
        let expected = 2
        let actual = ChocobarSegment.birthday(s: input, d: d, m: m)
        XCTAssertEqual(expected, actual)
    }
}
