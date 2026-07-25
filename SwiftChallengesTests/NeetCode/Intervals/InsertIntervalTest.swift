//
//  InsertIntervalTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/24/26.
//

import XCTest

class InsertIntervalTest: XCTestCase {

    private let sut = InsertInterval()

    private func verify(_ intervals: [[Int]], _ newInterval: [Int], _ expected: [[Int]], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.insert(intervals, newInterval), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyIntervals() {
        verify([], [5, 7], [[5, 7]])
    }

    func testSingleIntervalNoOverlap() {
        verify([[1, 2]], [4, 5], [[1, 2], [4, 5]])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([[1, 3], [6, 9]], [2, 5], [[1, 5], [6, 9]])
    }

    func testExample2() {
        verify([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8], [[1, 2], [3, 10], [12, 16]])
    }

    // MARK: - Edge cases

    func testInsertBeforeAll() {
        verify([[3, 5], [7, 9]], [1, 2], [[1, 2], [3, 5], [7, 9]])
    }

    func testInsertAfterAll() {
        verify([[1, 2], [3, 5]], [7, 9], [[1, 2], [3, 5], [7, 9]])
    }

    func testNewIntervalSwallowsAll() {
        verify([[2, 3], [5, 6], [8, 9]], [1, 10], [[1, 10]])
    }

    func testNewIntervalContained() {
        verify([[1, 10]], [3, 4], [[1, 10]])
    }

    func testTouchingEndpointsMerge() {
        verify([[1, 3], [5, 7]], [3, 5], [[1, 7]])
    }

    func testZeroWidthNewInterval() {
        verify([[1, 3], [6, 9]], [4, 4], [[1, 3], [4, 4], [6, 9]])
    }

    func testNegativeValues() {
        verify([[-5, -3], [1, 4]], [-4, 0], [[-5, 0], [1, 4]])
    }
}
