//
//  BurstBalloonsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/8/26.
//

import XCTest

class BurstBalloonsTest: XCTestCase {

    private let sut = BurstBalloons()

    private func verify(_ nums: [Int], expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.maxCoins(nums), expected, file: file, line: line)
        XCTAssertEqual(sut.maxCoinsV2(nums), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyArray() {
        verify([], expected: 0)
    }

    func testSingleBalloon() {
        verify([5], expected: 5)
    }

    func testTwoBalloons() {
        verify([1, 1], expected: 2)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([3, 1, 5, 8], expected: 167)
    }

    func testExample2() {
        verify([1, 5], expected: 10)
    }

    // MARK: - Edge cases

    func testAllOnes() {
        verify([1, 1, 1], expected: 3)
    }

    func testDuplicateValues() {
        verify([3, 3], expected: 12)
    }

    func testZeroValuedBalloon() {
        verify([0], expected: 0)
    }

    func testZeroInMiddle() {
        verify([3, 0, 5], expected: 20)
    }
}
