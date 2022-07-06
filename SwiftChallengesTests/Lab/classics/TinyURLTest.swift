//
//  TinyURLTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/1/22.
//

import XCTest

class TinyURLTest: XCTestCase {
    func testBasicV1_01() throws {
        let tiny = TinyURL()
        let input = "https://developer.apple.com"
        let shortUrl = tiny.encode(input)
        print("url: \(shortUrl)")
    }

    func testBasicV2_01() throws {
        let tiny = TinyURL()
        let input = "https://developer.apple.com"
        let shortUrl = tiny.encode(input, 8)
        print("url: \(shortUrl)")
    }
}
