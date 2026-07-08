//
//  LongestIncreasingSubsequenceTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/7/26.
//

import XCTest

class LongestIncreasingSubsequenceTest: XCTestCase {

    private let sut = LongestIncreasingSubsequence()

    private func verify(
        _ nums: [Int],
        _ expected: Int,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertEqual(sut.lengthOfLIS(nums), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyArray() {
        verify([], 0)
    }

    func testSingleElement() {
        verify([5], 1)
    }

    func testTwoElementsIncreasing() {
        verify([1, 2], 2)
    }

    func testTwoElementsDecreasing() {
        verify([2, 1], 1)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([10, 9, 2, 5, 3, 7, 101, 18], 4)
    }

    func testExample2() {
        verify([0, 1, 0, 3, 2, 3], 4)
    }

    func testExample3() {
        verify([7, 7, 7, 7, 7, 7, 7], 1)
    }

    // MARK: - Edge cases

    func testStrictlyDecreasing() {
        verify([5, 4, 3, 2, 1], 1)
    }

    func testStrictlyIncreasing() {
        verify([1, 2, 3, 4, 5], 5)
    }

    func testNegativeNumbers() {
        verify([-2, -1, -3, 0, -4], 3)
    }

    func testWithDuplicates() {
        verify([4, 10, 4, 3, 8, 9], 3)
    }
}
