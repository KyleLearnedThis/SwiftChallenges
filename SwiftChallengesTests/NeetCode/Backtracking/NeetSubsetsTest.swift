//
//  NeetSubsetsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/14/26.
//

import XCTest

class NeetSubsetsTest: XCTestCase {

    private let sut = NeetSubsets()

    private func sorted(_ subsets: [[Int]]) -> [[Int]] {
        subsets.map { $0.sorted() }.sorted { $0.lexicographicallyPrecedes($1) }
    }

    private func verify(_ nums: [Int], expected: [[Int]], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sorted(sut.subsets(nums)), sorted(expected), file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyArray() {
        verify([], expected: [[]])
    }

    func testSingleElement() {
        verify([1], expected: [[], [1]])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([1, 2, 3], expected: [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]])
    }

    func testExample2() {
        verify([0], expected: [[], [0]])
    }

    // MARK: - Two elements

    func testTwoElements() {
        verify([1, 2], expected: [[], [1], [2], [1, 2]])
    }

    // MARK: - Subset count

    // Power set of n elements always has 2^n subsets
    func testSubsetCountFourElements() {
        XCTAssertEqual(sut.subsets([1, 2, 3, 4]).count, 16)
    }

    func testSubsetCountFiveElements() {
        XCTAssertEqual(sut.subsets([1, 2, 3, 4, 5]).count, 32)
    }

    // MARK: - Negative numbers

    func testNegativeNumbers() {
        verify([-1, 0, 1], expected: [[], [-1], [0], [1], [-1, 0], [-1, 1], [0, 1], [-1, 0, 1]])
    }

    // MARK: - No duplicates in output

    func testNoDuplicateSubsets() {
        let result = sut.subsets([1, 2, 3])
        let unique = Set(result.map { $0.sorted() }.map { $0.description })
        XCTAssertEqual(result.count, unique.count)
    }
}
