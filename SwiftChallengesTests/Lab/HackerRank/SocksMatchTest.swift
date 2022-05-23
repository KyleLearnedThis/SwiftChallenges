//
//  SocksMatchTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/22/22.
//

import XCTest

class SocksMatchTest: XCTestCase {
    func testBasic01() throws {
        let input = [10, 20, 20, 10, 10, 30, 50, 10, 20]
        let expected = 3
        let actual = SocksMatch.sockMerchant(n: input.count, ar: input)
        XCTAssertEqual(expected, actual)
    }
}
