//
//  KeyboardRowTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/2/22.
//

import XCTest

class KeyboardRowTest: XCTestCase {
    func testBasic01() throws {
        let input = ["Hello","Alaska","Dad","Peace"]
        let expected = ["Alaska", "Dad"]
        let actual = KeyboardRow.findWords(input)
        XCTAssertEqual(Set(actual), Set(expected))
    }

    func testBasic02() throws {
        let input = ["omk"]
        let actual = KeyboardRow.findWords(input)
        XCTAssertTrue(actual.isEmpty)
    }
}
