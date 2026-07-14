//
//  RotateImageTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class RotateImageTest: XCTestCase {

    private let sut = RotateImage()

    private func verify(_ input: [[Int]], _ expected: [[Int]], file: StaticString = #filePath, line: UInt = #line) {
        var matrix = input
        sut.rotate(&matrix)
        XCTAssertEqual(matrix, expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([[1]], [[1]])
    }

    func testTwoByTwo() {
        verify([[1, 2], [3, 4]], [[3, 1], [4, 2]])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(
            [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
            [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
        )
    }

    func testExample2() {
        verify(
            [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]],
            [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]
        )
    }

    // MARK: - Edge cases

    func testNegativeValues() {
        verify(
            [[-1, -2], [-3, -4]],
            [[-3, -1], [-4, -2]]
        )
    }

    func testDuplicateValues() {
        verify(
            [[1, 1], [1, 1]],
            [[1, 1], [1, 1]]
        )
    }
}
