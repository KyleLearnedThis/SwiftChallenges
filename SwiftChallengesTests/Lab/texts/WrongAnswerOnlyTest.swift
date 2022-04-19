//
//  WrongAnswerOnlyTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/19/22.
//

import XCTest

class WrongAnswerOnlyTest: XCTestCase {
    func testBasic01() throws {
        let input = "ABA"
        let expected = "BAB"
        let actual = WrongAnswerOnly.getWrongAnswers(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = "BBBBB"
        let expected = "AAAAA"
        let actual = WrongAnswerOnly.getWrongAnswers(input)
        XCTAssertEqual(expected, actual)
    }
}
