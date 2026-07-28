//
//  FindAllNumbersDisappearedInArrayTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/25/26.
//

import XCTest

class FindAllNumbersDisappearedInArrayTest: XCTestCase {

    private let sut = FindAllNumbersDisappearedInArray()

    private func verify(_ nums: [Int], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.findDisappearedNumbers(nums).sorted(), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElementPresent() {
        verify([1], [])
    }

    func testSingleElementDuplicatedRange() {
        verify([1, 1], [2])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([4, 3, 2, 7, 8, 2, 3, 1], [5, 6])
    }

    func testExample2() {
        verify([1, 1], [2])
    }

    // MARK: - Edge cases

    func testNoneMissing() {
        verify([1, 2, 3, 4, 5], [])
    }

    func testAllMissingExceptOne() {
        verify([2, 2, 2, 2], [1, 3, 4])
    }

    func testMissingFirst() {
        verify([2, 3, 4, 4], [1])
    }

    func testMissingLast() {
        verify([1, 2, 3, 3], [4])
    }

    func testAlreadySorted() {
        verify([1, 2, 2, 4, 5], [3])
    }
}
