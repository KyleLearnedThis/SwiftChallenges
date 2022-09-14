//
//  DepositProfitTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/8/22.
//

import XCTest

class DepositProfitTest: XCTestCase {
    func testBasic01() {
        let deposit = 100
        let rate = 20
        let threshold = 170
        let expected = 3
        let actual = DepositProfit.calculate(deposit: deposit, rate: rate, threshold: threshold)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() {
        let deposit = 100
        let rate = 1
        let threshold = 101
        let expected = 1
        let actual = DepositProfit.calculate(deposit: deposit, rate: rate, threshold: threshold)
        XCTAssertEqual(expected, actual)
    }
}
