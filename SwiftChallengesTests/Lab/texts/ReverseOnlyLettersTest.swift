//
//  ReverseOnlyLettersTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/reverse-only-letters/

import XCTest

class ReverseOnlyLettersTest: XCTestCase {

    func testBasic() {
        let input = "ab-cd"
        let expected = "dc-ba"
        let actual = ReverseOnlyLetters.reverseOnlyLetters(input)
        XCTAssertEqual(expected, actual)
    }

}
