//
//  FindAllDuplicatesInArrayTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/27/26.
//

import XCTest

class FindAllDuplicatesInArrayTest: XCTestCase {

    private let sut = FindAllDuplicatesInArray()

    private func verify(_ nums: [Int], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.findDuplicates(nums).sorted(), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([1], [])
    }

    func testSingleDuplicate() {
        verify([1, 1], [1])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([4, 3, 2, 7, 8, 2, 3, 1], [2, 3])
    }

    func testExample2() {
        verify([1, 1, 2], [1])
    }

    func testExample3() {
        verify([1], [])
    }

    // MARK: - Edge cases

    func testNoDuplicates() {
        verify([1, 2, 3, 4], [])
    }

    func testAllDuplicated() {
        verify([1, 1, 2, 2], [1, 2])
    }

    func testDuplicateIsSmallestValue() {
        verify([1, 1, 3], [1])
    }

    func testDuplicateIsLargestValue() {
        verify([3, 3, 1], [3])
    }

    func testAlreadySorted() {
        verify([1, 2, 2, 3, 3], [2, 3])
    }

    func testReverseSorted() {
        verify([5, 4, 4, 2, 2], [2, 4])
    }
}
