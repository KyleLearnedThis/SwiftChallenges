//
//  ValidParenthesesTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class ValidParenthesesTest: XCTestCase {

    func test01() {
        let expected = true
        let actual = ValidParentheses.isValid("(())")
        XCTAssertEqual(expected, actual)
    }

    func test02() {
        let expected = true
        let actual = ValidParentheses.isValid("(()())")
        XCTAssertEqual(expected, actual)
    }

    func test03() {
        let expected = false
        let actual = ValidParentheses.isValid("((((")
        XCTAssertEqual(expected, actual)
    }

    func test04() {
        let expected = false
        let actual = ValidParentheses.isValid("))))")
        XCTAssertEqual(expected, actual)
    }

    func testBalancedV01() {
        let expected = true
        let input = "{[()]}"
        let actual = ValidParentheses.isBalanced(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBalancedV02() {
        let expected = true
        let input = "{}()"
        let actual = ValidParentheses.isBalanced(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBalancedV03() {
        let expected = false
        let input = "{(})"
        let actual = ValidParentheses.isBalanced(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBalancedV04() {
        let expected = false
        let input = "("
        let actual = ValidParentheses.isBalanced(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testRemoveMinimum01() throws {
        let input = "lee(t(c)o)de)"
        let expected = "lee(t(c)o)de"
        let actual = ValidParentheses.minRemoveToMakeValid(input)
        XCTAssertEqual(expected, actual)
    }

    func testRemoveMinimum02() throws {
        let input = "a)b(c)d"
        let expected = "ab(c)d"
        let actual = ValidParentheses.minRemoveToMakeValid(input)
        XCTAssertEqual(expected, actual)
    }

    func testRemoveMinimum03() throws {
        let input = "a(b(c)d"
        let expected = "ab(c)d"
        let actual = ValidParentheses.minRemoveToMakeValid(input)
        XCTAssertEqual(expected, actual)
    }
}
