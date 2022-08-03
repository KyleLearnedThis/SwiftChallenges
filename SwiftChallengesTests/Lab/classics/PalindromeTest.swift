//
//  PalindromeTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 3/15/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import XCTest

class PalindromeTest: XCTestCase {
    func testBasic() throws {
        let input = "A man, a plan, a canal: Panama"
        let expected = true
        let actual = Palindrome.isPalindrome(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV2() throws {
        let input = "A man, a plan, a canal: Panama"
        let expected = true
        let actual = Palindrome.isPalindromeV2(input)
        XCTAssertEqual(expected, actual)
    }

    func testLongestV01() throws {
        let input = "abccccdd"
        let expected = 7
        let actual = Palindrome.longestPalindrome(input)
        XCTAssertEqual(expected, actual)
    }

    func testLongestV02() throws {
        let input = "a"
        let expected = 1
        let actual = Palindrome.longestPalindrome(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicII01() throws {
        let input = "aba"
        let expected = true
        let p = Palindrome()
        let actual = p.validPalindromeII(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicII02() throws {
        let input = "abca"
        let expected = true
        let p = Palindrome()
        let actual = p.validPalindromeII(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicII03() throws {
        let input = "abc"
        let expected = false
        let p = Palindrome()
        let actual = p.validPalindromeII(input)
        XCTAssertEqual(expected, actual)
    }
}
