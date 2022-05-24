//
//  PageTurnCountTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/23/22.
//

import XCTest

class PageTurnCountTest: XCTestCase {
    func testBasic01() throws {
        let n = 6
        let p = 2
        let expected = 1
        let actual = PageTurnCount.pageCount(n: n, p: p)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let n = 5
        let p = 4
        let expected = 0
        let actual = PageTurnCount.pageCount(n: n, p: p)
        XCTAssertEqual(expected, actual)
    }
}
