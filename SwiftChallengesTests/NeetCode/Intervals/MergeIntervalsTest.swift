//
//  MergeIntervalsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/21/26.
//

import XCTest

class MergeIntervalsTest: XCTestCase {

    private let sut = MergeIntervals()

    private func sorted(_ intervals: [[Int]]) -> [[Int]] {
        return intervals.sorted { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] < $1[1] }
    }

    private func verify(_ intervals: [[Int]], _ expected: [[Int]], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sorted(sut.merge(intervals)), sorted(expected), file: file, line: line)
    }

    // MARK: - Base cases

    func testEmpty() {
        verify([], [])
    }

    func testSingleInterval() {
        verify([[1, 4]], [[1, 4]])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        // [1,3] and [2,6] overlap -> [1,6]
        verify([[1, 3], [2, 6], [8, 10], [15, 18]], [[1, 6], [8, 10], [15, 18]])
    }

    func testExample2() {
        // Intervals [1,4] and [4,5] are considered overlapping
        verify([[1, 4], [4, 5]], [[1, 5]])
    }

    // MARK: - Edge cases

    func testUnsortedInput() {
        verify([[2, 6], [1, 3], [15, 18], [8, 10]], [[1, 6], [8, 10], [15, 18]])
    }

    func testFullyContained() {
        verify([[1, 10], [2, 3], [4, 8]], [[1, 10]])
    }

    func testNoOverlap() {
        verify([[1, 2], [3, 4], [5, 6]], [[1, 2], [3, 4], [5, 6]])
    }

    func testTouchingEndpoints() {
        verify([[1, 4], [4, 5], [5, 6]], [[1, 6]])
    }

    func testDuplicateIntervals() {
        verify([[1, 4], [1, 4]], [[1, 4]])
    }
}
