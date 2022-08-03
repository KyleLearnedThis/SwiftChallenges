//
//  CommonCharacterCountTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/3/22.
//

import XCTest

class CommonCharacterCountTest: XCTestCase {
    func testBasic01() throws {
        let s1 = "aabcc"
        let s2 = "adcaa"
        let expected = 3
        let ccc = CommonCharacterCount()
        let actual = ccc.commonCharacters(s1: s1, s2: s2)
        XCTAssertEqual(expected, actual)
    }
}
