//
//  SpiralMatrixTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/13/26.
//

import XCTest

class SpiralMatrixTest: XCTestCase {

    private let sut = SpiralMatrix()

    private func verify(_ matrix: [[Int]], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.spiralOrder(matrix), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([[1]], [1])
    }

    func testSingleRow() {
        verify([[1, 2, 3, 4]], [1, 2, 3, 4])
    }

    func testSingleColumn() {
        verify([[1], [2], [3], [4]], [1, 2, 3, 4])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(
            [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
            [1, 2, 3, 6, 9, 8, 7, 4, 5]
        )
    }

    func testExample2() {
        verify(
            [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]],
            [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
        )
    }

    // MARK: - Edge cases

    func testTwoByTwo() {
        verify([[1, 2], [3, 4]], [1, 2, 4, 3])
    }

    func testTallRectangle() {
        verify(
            [[1, 2], [3, 4], [5, 6]],
            [1, 2, 4, 6, 5, 3]
        )
    }

    func testNegativeValues() {
        verify(
            [[-1, -2], [-3, -4]],
            [-1, -2, -4, -3]
        )
    }
}
