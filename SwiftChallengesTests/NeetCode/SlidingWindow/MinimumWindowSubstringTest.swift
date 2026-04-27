//
//  MinimumWindowSubstringTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/19/26.
//

import XCTest

class MinimumWindowSubstringTest: XCTestCase {
    let mws = MinimumWindowSubstring()

    func testBasic01() {
        let s = "ADOBECODEBANC"
        let t = "ABC"
        let expected = "BANC"
        let actual = mws.minWindow(s, t)
        XCTAssertEqual(actual, expected)
    }
    
    func testBasic02() {
        let s = "a"
        let t = "a"
        let expected = "a"
        let actual = mws.minWindow(s, t)
        XCTAssertEqual(actual, expected)
    }
    
    func testBasic03() {
        let s = "a"
        let t = "aa"
        let expected = ""
        let actual = mws.minWindow(s, t)
        XCTAssertEqual(actual, expected)
    }
}
