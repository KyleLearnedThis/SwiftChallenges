//
//  LongestCommonPrefixTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class LongestCommonPrefixTest: XCTestCase {

    func test01() {
        let input = ["abcd", "abcde", "abcdef", "abc"]
        let expected = "abc"
        let actual = LongestCommonPrefix.longestCommonPrefix(input)
        XCTAssertEqual(actual, expected)
    }

    func test02() {
        let input = ["abab","aba","abc"]
        let expected = "ab"
        let actual = LongestCommonPrefix.longestCommonPrefix(input)
        XCTAssertEqual(actual, expected)
    }
}
