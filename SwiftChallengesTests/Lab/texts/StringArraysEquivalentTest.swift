//
//  StringArraysEquivalentTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class StringArraysEquivalentTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCase01() throws {
        let word1 = ["ab", "c"]
        let word2 = ["a", "bc"]
        let expected = true
        let actual = StringArraysEquivalent.arrayStringsAreEqual(word1, word2)
        XCTAssertEqual(expected, actual, "Failed to equal to expected value")
    }

    func testCase02() throws {
        let word1 = ["a", "cb"]
        let word2 = ["ab", "c"]
        let expected = false
        let actual = StringArraysEquivalent.arrayStringsAreEqual(word1, word2)
        XCTAssertEqual(expected, actual, "Failed to equal to expected value")
    }

    func testCase03() throws {
        let word1 = ["abc", "d", "defg"]
        let word2 = ["abcddefg"]
        let expected = true
        let actual = StringArraysEquivalent.arrayStringsAreEqual(word1, word2)
        XCTAssertEqual(expected, actual, "Failed to equal to expected value")
    }
}
