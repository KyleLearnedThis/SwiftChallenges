//
//  NonOverlappingIntervalsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/25/26.
//

import XCTest

class NonOverlappingIntervalsTest: XCTestCase {

    private let sut = NonOverlappingIntervals()

    private func verify(_ intervals: [[Int]], _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.eraseOverlapIntervals(intervals), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyIntervals() {
        verify([], 0)
    }

    func testSingleInterval() {
        verify([[1, 2]], 0)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([[1, 2], [2, 3], [3, 4], [1, 3]], 1)
    }

    func testExample2() {
        verify([[1, 2], [1, 2], [1, 2]], 2)
    }

    func testExample3() {
        verify([[1, 2], [2, 3]], 0)
    }

    // MARK: - Edge cases

    func testTouchingEndpointsAreNotOverlaps() {
        verify([[1, 2], [2, 3], [3, 4]], 0)
    }

    func testUnsortedInputWithoutOverlaps() {
        verify([[3, 4], [1, 2], [2, 3]], 0)
    }

    func testNestedIntervalPrefersShorterEnd() {
        verify([[1, 10], [2, 3], [4, 5]], 1)
    }

    func testMultipleNestedOverlaps() {
        verify([[1, 100], [11, 22], [1, 11], [2, 12]], 2)
    }

    func testNegativeValues() {
        verify([[-5, -3], [-4, -1], [0, 2]], 1)
    }
}
