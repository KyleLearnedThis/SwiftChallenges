//
//  GoalParserTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/6/22.
//

import XCTest

class GoalParserTest: XCTestCase {

    func testBasic01() throws {
        let input = "G()(al)"
        let expected = "Goal"
        let actual = GoalParser.interpret(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = "G()()()()(al)"
        let expected = "Gooooal"
        let actual = GoalParser.interpret(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() throws {
        let input = "(al)G(al)()()G"
        let expected = "alGalooG"
        let actual = GoalParser.interpret(input)
        XCTAssertEqual(expected, actual)
    }

}
