//
//  ReverseParenthesesTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/3/22.
//

import XCTest

class ReverseParenthesesTest: XCTestCase {
    func testBasic01() throws {
        let input = "(bar)"
        let expected = "rab"
        let actual = ReverseParentheses.reverseParentheses(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = "foo(bar(baz))blim"
        let expected = "foobazrabblim"
        let actual = ReverseParentheses.reverseParentheses(input)
        XCTAssertEqual(expected, actual)
    }
}
