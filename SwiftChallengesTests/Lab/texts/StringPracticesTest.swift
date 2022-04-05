//
//  StringPracticesTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class StringPracticesTest: XCTestCase {
    func testReverse01() {
        let input = "HELLO"
        let expected = "OLLEH"
        let actual = StringPractices.reverse01(input)
        XCTAssertEqual(actual, expected)
    }

    func testReverse02() {
        var input = Array("12345")
        let expected = Array("54321")
        let sp = StringPractices()

        sp.reverse02(&input)
        let result = String(input)
        print("======= input: \(result)")
        XCTAssertEqual(input, expected)
    }

    func testLowerCase() {
        let input = "HELLO"
        let expected = "hello"
        let actual = StringPractices.toLowerCase(input)
        XCTAssertEqual(actual, expected)
    }

    func testRemoveOuterParentheses() {
        let input = "(HELLO)"
        let expected = "HELLO"
        let actual = StringPractices.removeOutermostParentheses(input)
        XCTAssertEqual(actual, expected)
    }

    func testRotation01() {
        let input = "HELLO"
        let goal = "ELLOH"
        let expected = true
        let actual = StringPractices.rotateString(input, goal)
        XCTAssertEqual(actual, expected)
    }

    func testRotation02() {
        let input = "HELLO"
        let goal = "OHELL"
        let expected = true
        let actual = StringPractices.rotateString(input, goal)
        XCTAssertEqual(actual, expected)
    }

    func testRemovelDuplicateCharacters() {
        let input = "zvvvvoo"
        let expected = "zvo"
        let actual = StringPractices.removeDuplicates(input)
        XCTAssertEqual(expected, actual)
    }
}
