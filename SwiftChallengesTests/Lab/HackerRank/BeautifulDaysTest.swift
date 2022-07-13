//
//  BeautifulDaysTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/13/22.
//

import XCTest

class BeautifulDaysTest: XCTestCase {
    func testBasic01() throws {
        let l = 20
        let r = 23
        let k = 6
        let expected = 2
        let actual = BeautifulDays.beautifulDays(i: l, j: r, k: k)
        XCTAssertEqual(expected, actual)
    }
}
