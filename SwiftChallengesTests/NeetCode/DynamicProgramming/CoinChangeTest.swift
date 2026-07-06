//
//  CoinChangeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/5/26.
//

import XCTest

class CoinChangeTest: XCTestCase {

    private let sut = CoinChange()

    private func verifyV1(_ coins: [Int], _ amount: Int, expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.coinChange(coins, amount), expected, file: file, line: line)
    }

    private func verifyV2(_ coins: [Int], _ amount: Int, expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.coinChangeV2(coins, amount), expected, file: file, line: line)
    }

    // MARK: - V1 Base cases

    func testV1ZeroAmount() {
        verifyV1([1, 5, 10], 0, expected: 0)
    }

    func testV1SingleCoinExact() {
        verifyV1([5], 5, expected: 1)
    }

    func testV1SingleCoinImpossible() {
        verifyV1([5], 3, expected: -1)
    }

    // MARK: - V1 LeetCode examples

    func testV1Example1() {
        verifyV1([1, 5, 11], 15, expected: 3)
    }

    func testV1Example2() {
        verifyV1([2], 3, expected: -1)
    }

    func testV1Example3() {
        verifyV1([1], 0, expected: 0)
    }

    // MARK: - V1 Edge cases

    func testV1LargeAmount() {
        verifyV1([1, 5, 10, 25], 100, expected: 4)
    }

    func testV1NoExactChange() {
        verifyV1([3, 7], 5, expected: -1)
    }

    func testV1MultipleDenominations() {
        verifyV1([1, 2, 5], 11, expected: 3)
    }

    // MARK: - V2 Base cases

    func testV2ZeroAmount() {
        verifyV2([1, 5, 10], 0, expected: 0)
    }

    func testV2SingleCoinExact() {
        verifyV2([5], 5, expected: 1)
    }

    func testV2SingleCoinImpossible() {
        verifyV2([5], 3, expected: -1)
    }

    // MARK: - V2 LeetCode examples

    func testV2Example1() {
        verifyV2([1, 5, 11], 15, expected: 3)
    }

    func testV2Example2() {
        verifyV2([2], 3, expected: -1)
    }

    func testV2Example3() {
        verifyV2([1], 0, expected: 0)
    }

    // MARK: - V2 Edge cases

    func testV2LargeAmount() {
        verifyV2([1, 5, 10, 25], 100, expected: 4)
    }

    func testV2NoExactChange() {
        verifyV2([3, 7], 5, expected: -1)
    }

    func testV2MultipleDenominations() {
        verifyV2([1, 2, 5], 11, expected: 3)
    }
}
