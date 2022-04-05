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
}
