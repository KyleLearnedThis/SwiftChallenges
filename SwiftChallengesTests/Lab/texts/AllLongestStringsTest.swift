//
//  AllLongestStringsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/3/22.
//

import XCTest

class AllLongestStringsTest: XCTestCase {
    func testBasic01() throws {
        let input = ["aba", "aa", "ad", "vcd", "aba"]
        let expected = ["aba", "vcd", "aba"]
        let ls = AllLongestStrings()
        let actual = ls.longest(inputArray: input)
        XCTAssertEqual(expected, actual)
    }
}
