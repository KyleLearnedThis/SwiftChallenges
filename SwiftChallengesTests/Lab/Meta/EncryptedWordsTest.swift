//
//  EncryptedWordsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/1/22.
//

import XCTest

class EncryptedWordsTest: XCTestCase {
    func testBasicV01() throws {
        let input = "abc"
        let expected = "bac"
        let actual = EncryptedWords.findEncryptedWord(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV02() throws {
        let input = "facebook"
        let expected = "eafcobok"
        let actual = EncryptedWords.findEncryptedWord(s: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasicV03() throws {
        let input = "abcxcba"
        let expected = "xbacbca"
        let actual = EncryptedWords.findEncryptedWord(s: input)
        XCTAssertEqual(expected, actual)
    }
}
