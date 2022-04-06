//
//  SortingSentenceTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/6/22.
//

import XCTest

class SortingSentenceTest: XCTestCase {

    func testBasic01() throws {
        let input = "is2 sentence4 This1 a3"
        let expected = "This is a sentence"
        let actual = SortingSentence.sortSentence(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = "Myself2 Me1 I4 and3"
        let expected = "Me Myself and I"
        let actual = SortingSentence.sortSentence(input)
        XCTAssertEqual(expected, actual)
    }
}
