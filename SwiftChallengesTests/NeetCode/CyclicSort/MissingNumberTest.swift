//
//  MissingNumberTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/25/26.
//

import XCTest

class MissingNumberTest: XCTestCase {

    private let sut = MissingNumber()

    private func verify(_ nums: [Int], _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.missingNumber(nums), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElementMissingOne() {
        verify([0], 1)
    }

    func testSingleElementMissingZero() {
        verify([1], 0)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([3, 0, 1], 2)
    }

    func testExample2() {
        verify([0, 1], 2)
    }

    func testExample3() {
        verify([9, 6, 4, 2, 3, 5, 7, 0, 1], 8)
    }

    // MARK: - Edge cases

    func testMissingFirst() {
        verify([1, 2, 3, 4], 0)
    }

    func testMissingLast() {
        verify([0, 1, 2, 3], 4)
    }

    func testMissingMiddle() {
        verify([0, 1, 3, 4, 5], 2)
    }

    func testAlreadySorted() {
        verify([0, 1, 2, 3, 5], 4)
    }
}
