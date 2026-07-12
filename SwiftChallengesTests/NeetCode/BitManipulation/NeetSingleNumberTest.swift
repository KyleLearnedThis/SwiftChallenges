//
//  NeetSingleNumberTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class NeetSingleNumberTest: XCTestCase {

    private let sut = NeetSingleNumber()

    private func verify(_ nums: [Int], _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.singleNumber(nums), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([5], 5)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([2, 2, 1], 1)
    }

    func testExample2() {
        verify([4, 1, 2, 1, 2], 4)
    }

    func testExample3() {
        verify([1], 1)
    }

    // MARK: - Edge cases

    func testNegativeNumbers() {
        verify([-1, -1, 2], 2)
    }

    func testSingleNumberAtEnd() {
        verify([1, 1, 2, 2, 3], 3)
    }
}
