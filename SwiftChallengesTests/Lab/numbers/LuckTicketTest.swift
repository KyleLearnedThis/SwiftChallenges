//
//  LuckTicketTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/3/22.
//

import XCTest

class LuckTicketTest: XCTestCase {
    func testBasic01() throws {
        let n = 1230
        let expected = true
        let actual = LuckTicket.isLucky(n: n)
        XCTAssertEqual(expected, actual)
    }
}
