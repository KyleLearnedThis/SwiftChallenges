//
//  NeetPermutationsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/15/26.
//

import XCTest

class NeetPermutationsTest: XCTestCase {

    private let sut = NeetPermutations()

    private func sorted(_ perms: [[Int]]) -> [[Int]] {
        perms.map { $0.sorted() }.sorted { $0.lexicographicallyPrecedes($1) }
    }

    private func verify(_ nums: [Int], expected: [[Int]], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sorted(sut.permute(nums)), sorted(expected), file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleElement() {
        verify([1], expected: [[1]])
    }

    func testTwoElements() {
        verify([0, 1], expected: [[0, 1], [1, 0]])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([1, 2, 3], expected: [
            [1, 2, 3], [1, 3, 2],
            [2, 1, 3], [2, 3, 1],
            [3, 1, 2], [3, 2, 1]
        ])
    }

    func testExample2() {
        verify([0, 1], expected: [[0, 1], [1, 0]])
    }

    func testExample3() {
        verify([1], expected: [[1]])
    }

    // MARK: - Edge cases

    func testPermutationCount() {
        XCTAssertEqual(sut.permute([1, 2, 3]).count, 6)
        XCTAssertEqual(sut.permute([1, 2, 3, 4]).count, 24)
    }

    func testNoPermutationIsDuplicated() {
        let result = sut.permute([1, 2, 3])
        let unique = Set(result.map { $0.description })
        XCTAssertEqual(result.count, unique.count)
    }

    func testNegativeNumbers() {
        verify([-1, 0, 1], expected: [
            [-1, 0, 1], [-1, 1, 0],
            [0, -1, 1], [0, 1, -1],
            [1, -1, 0], [1, 0, -1]
        ])
    }
}
