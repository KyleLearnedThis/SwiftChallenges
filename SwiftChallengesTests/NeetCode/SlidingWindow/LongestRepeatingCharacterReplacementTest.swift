//
//  LongestRepeatingCharacterReplacementTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/25/26.
//

import XCTest

class LongestRepeatingCharacterReplacementTest: XCTestCase {
    let challenge = LongestRepeatingCharacterReplacement()
    func testBasic01() {
        let input = "ABAB"
        let k = 2
        let expected: Int = 4
        let actual = challenge.characterReplacement(input, k)
        XCTAssertEqual(actual, expected)
    }
    
    func testBasic02() {
        let input = "AABABBA"
        let k = 1
        let expected: Int = 4
        let actual = challenge.characterReplacement(input, k)
        XCTAssertEqual(actual, expected)
    }
}
