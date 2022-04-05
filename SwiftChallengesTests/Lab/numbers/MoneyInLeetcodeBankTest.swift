//
//  MoneyInLeetcodeBankTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 1/31/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class MoneyInLeetcodeBankTest: XCTestCase {

    func testCase01() throws {
        let n = 4
        let expected = 10
        testWork(n, expected)
    }

    func testCase02() throws {
        let n = 10
        let expected = 37
        testWork(n, expected)
    }

    func testCase03() throws {
        let n = 20
        let expected = 96
        testWork(n, expected)
    }

    private func testWork(_ n: Int, _ expected: Int) {
        let actual = MoneyInLeetcodeBank.totalMoney(n)
        XCTAssertEqual(expected, actual, "Failed the expectation")
    }

}
