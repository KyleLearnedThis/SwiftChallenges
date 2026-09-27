//
//  KthLargestElementInArrayTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/26/26.
//

import XCTest

class KthLargestElementInArrayTest: XCTestCase {

    private let sut = KthLargestElementInArray()

    private func verify(_ nums: [Int], _ k: Int, _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.findKthLargest(nums, k), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([1], 1, 1)
    }

    func testTwoElements() {
        verify([2, 1], 1, 2)
        verify([2, 1], 2, 1)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([3, 2, 1, 5, 6, 4], 2, 5)
    }

    func testExample2() {
        verify([3, 2, 3, 1, 2, 4, 5, 5, 6], 4, 4)
    }

    // MARK: - Edge cases

    func testKEqualsOne() {
        verify([7, 3, 9, 1], 1, 9)
    }

    func testKEqualsCount() {
        verify([7, 3, 9, 1], 4, 1)
    }

    func testAllSameElement() {
        verify([4, 4, 4, 4], 2, 4)
    }

    func testDuplicatesSpanKthPosition() {
        verify([5, 5, 5, 2, 1], 3, 5)
    }

    func testNegativeNumbers() {
        verify([-1, -5, -3, -2], 2, -2)
    }

    func testMixedSigns() {
        verify([-4, 0, 3, -1, 2], 3, 0)
    }

    func testAlreadySortedAscending() {
        verify([1, 2, 3, 4, 5], 2, 4)
    }

    func testAlreadySortedDescending() {
        verify([5, 4, 3, 2, 1], 2, 4)
    }
}
