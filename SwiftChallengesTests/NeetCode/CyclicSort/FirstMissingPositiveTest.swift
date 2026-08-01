//
//  FirstMissingPositiveTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/27/26.
//

import XCTest

class FirstMissingPositiveTest: XCTestCase {

    private let sut = FirstMissingPositive()

    private func verify(_ nums: [Int], _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.firstMissingPositive(nums), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElementOne() {
        verify([1], 2)
    }

    func testSingleElementNotOne() {
        verify([2], 1)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([1, 2, 0], 3)
    }

    func testExample2() {
        verify([3, 4, -1, 1], 2)
    }

    func testExample3() {
        verify([7, 8, 9, 11, 12], 1)
    }

    // MARK: - Edge cases

    func testAllNegatives() {
        verify([-1, -2, -3], 1)
    }

    func testAllZeros() {
        verify([0, 0, 0], 1)
    }

    func testDuplicates() {
        verify([1, 1, 1, 1], 2)
    }

    func testDuplicatesWithGap() {
        verify([1, 2, 2, 3], 4)
    }

    func testContiguousFromOne() {
        verify([1, 2, 3, 4, 5], 6)
    }

    func testUnsortedContiguous() {
        verify([5, 3, 1, 4, 2], 6)
    }

    func testValuesExceedingLength() {
        verify([1, 1000, 2, 3], 4)
    }

    func testIntMaxPresent() {
        verify([Int.max, 1, 2], 3)
    }

    func testMixedSignsMissingMiddle() {
        verify([-5, 1, 2, 4, 5], 3)
    }
}
