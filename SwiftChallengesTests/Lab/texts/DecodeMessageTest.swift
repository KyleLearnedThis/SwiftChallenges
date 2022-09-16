//
//  DecodeMessageTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/15/22.
//

import XCTest

final class DecodeMessageTest: XCTestCase {
    func testBasic01() throws {
        let key = "eljuxhpwnyrdgtqkviszcfmabo"
        let message = "zwx hnfx lqantp mnoeius ycgk vcnjrdb"
        let expected = "the five boxing wizards jump quickly"
        let actual = DecodeMessage.decode(key, message)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let key = "the quick brown fox jumps over the lazy dog"
        let message = "vkbs bs t suepuv"
        let expected = "this is a secret"
        let actual = DecodeMessage.decode(key, message)
        XCTAssertEqual(expected, actual)
    }
}
