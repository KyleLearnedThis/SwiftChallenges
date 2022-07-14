//
//  PhoneLetterCombinationsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/14/22.
//

import XCTest

class PhoneLetterCombinationsTest: XCTestCase {
    func testBasic01() throws {
        let digits = "23"
        let actual = PhoneLetterCombinations.letterCombinations(digits)
        actual.forEach { text in
            print("[\(text)]", terminator: " ")
        }
        print("===============")
    }
}
