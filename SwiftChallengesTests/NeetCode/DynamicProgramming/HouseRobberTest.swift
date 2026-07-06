//
//  HouseRobberTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/5/26.
//

import XCTest

class HouseRobberTest: XCTestCase {

    private let sut = HouseRobber()

    private func verify(_ nums: [Int], _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.rob(nums), expected, file: file, line: line)
    }

    private func verifyV2(_ nums: [Int], _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.robV2(nums), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmpty() {
        verify([], 0)
    }

    func testSingleHouse() {
        verify([5], 5)
    }

    func testTwoHouses() {
        verify([2, 7], 7)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([1, 2, 3, 1], 4)
    }

    func testExample2() {
        verify([2, 7, 9, 3, 1], 12)
    }

    // MARK: - Edge cases

    func testAllSameValues() {
        verify([3, 3, 3, 3, 3], 9)
    }

    func testAlternatingHighLow() {
        verify([10, 1, 10, 1, 10], 30)
    }

    func testLargerSkip() {
        verify([5, 1, 1, 5], 10)
    }

    // MARK: - V2 (top-down)

    func testV2Empty() {
        verifyV2([], 0)
    }

    func testV2SingleHouse() {
        verifyV2([5], 5)
    }

    func testV2TwoHouses() {
        verifyV2([2, 7], 7)
    }

    func testV2Example1() {
        verifyV2([1, 2, 3, 1], 4)
    }

    func testV2Example2() {
        verifyV2([2, 7, 9, 3, 1], 12)
    }

    func testV2AllSameValues() {
        verifyV2([3, 3, 3, 3, 3], 9)
    }

    func testV2AlternatingHighLow() {
        verifyV2([10, 1, 10, 1, 10], 30)
    }

    func testV2LargerSkip() {
        verifyV2([5, 1, 1, 5], 10)
    }
}
