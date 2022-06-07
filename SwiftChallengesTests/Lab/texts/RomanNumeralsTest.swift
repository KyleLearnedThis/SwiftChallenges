//
//  RomanNumeralsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/22.
//

import XCTest

class RomanNumeralsTest: XCTestCase {
    func testToInt01() throws {
        let input = "MCMXCIV"
        let expected = 1994
        let rn = RomanNumerals()
        let actual = rn.romanToInt(input)
        XCTAssertEqual(expected, actual)
    }

    func testToInt02() throws {
        let input = "XIX"
        let expected = 19
        let rn = RomanNumerals()
        let actual = rn.romanToInt(input)
        XCTAssertEqual(expected, actual)
    }

    func testToInt03() throws {
        let input = "V"
        let expected = 5
        let rn = RomanNumerals()
        let actual = rn.romanToInt(input)
        XCTAssertEqual(expected, actual)
    }

    func testToRoman01() throws {
        let input = 1994
        let expected = "MCMXCIV"
        let rn = RomanNumerals()
        let actual = rn.intToRoman(input)
        XCTAssertEqual(expected, actual)
    }
}
