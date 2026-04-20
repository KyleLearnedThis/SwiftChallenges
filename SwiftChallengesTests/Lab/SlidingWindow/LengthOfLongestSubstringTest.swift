//
//  LengthOfLongestSubstringTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/19/26.
//

import XCTest

class LengthOfLongestSubstringTest: XCTestCase {
    let lls = LengthOfLongestSubstring()
    func testBasic001() {
        let input = "abcabcbb"
        let expected: Int = 3
        XCTAssertEqual(lls.lengthOfLongestSubstring(input), expected)
    }
    
    func testBasic002() {
        let input = "bbbbb"
        let expected: Int = 1
        XCTAssertEqual(lls.lengthOfLongestSubstring(input), expected)
    }
    
    func testBasic003() {
        let input = "pwwkew"
        let expected: Int = 3
        XCTAssertEqual(lls.lengthOfLongestSubstring(input), expected)
    }
}
