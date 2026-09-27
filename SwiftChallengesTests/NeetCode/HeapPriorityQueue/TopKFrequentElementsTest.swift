//
//  TopKFrequentElementsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/1/26.
//

import XCTest

class TopKFrequentElementsTest: XCTestCase {

    private let sut = TopKFrequentElements()

    private func verify(_ nums: [Int], _ k: Int, _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.topKFrequent(nums, k).sorted(), expected.sorted(), file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([1], 1, [1])
    }

    func testAllSameElement() {
        verify([7, 7, 7], 1, [7])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([1, 1, 1, 2, 2, 3], 2, [1, 2])
    }

    func testExample2() {
        verify([1], 1, [1])
    }

    // MARK: - Edge cases

    func testKEqualsDistinctCount() {
        verify([1, 2, 3], 3, [1, 2, 3])
    }

    func testNegativeNumbers() {
        verify([-1, -1, -2, -2, -2, 3], 2, [-2, -1])
    }

    func testZeroIncluded() {
        verify([0, 0, 1, 1, 1, 2], 2, [0, 1])
    }

    func testThreeDistinctFrequencies() {
        verify([5, 5, 5, 5, 6, 6, 6, 7, 7, 8], 3, [5, 6, 7])
    }

    func testDominantElement() {
        verify([4, 4, 4, 4, 1], 1, [4])
    }

    func testResultOrderIsIrrelevant() {
        verify([9, 8, 8, 9, 9, 8, 2], 2, [8, 9])
    }
}
