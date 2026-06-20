//
//  NeetCombinationSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/15/26.
//

import XCTest

class NeetCombinationSumTest: XCTestCase {

    private let sut = NeetCombinationSum()

    private func sorted(_ combinations: [[Int]]) -> [[Int]] {
        combinations.map { $0.sorted() }.sorted { $0.lexicographicallyPrecedes($1) }
    }

    private func verify(_ candidates: [Int], target: Int, expected: [[Int]], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sorted(sut.combinationSum(candidates, target)), sorted(expected), file: file, line: line)
    }

    // MARK: - Base cases

    func testEmptyCandidates() {
        verify([], target: 7, expected: [])
    }

    func testNoSolution() {
        verify([2], target: 1, expected: [])
    }

    func testSingleCandidateEqualsTarget() {
        verify([7], target: 7, expected: [[7]])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([2, 3, 6, 7], target: 7, expected: [[2, 2, 3], [7]])
    }

    func testExample2() {
        verify([2, 3, 5], target: 8, expected: [[2, 2, 2, 2], [2, 3, 3], [3, 5]])
    }

    func testExample3() {
        verify([2], target: 1, expected: [])
    }

    // MARK: - Edge cases

    func testAllCandidatesExceedTarget() {
        verify([5, 10, 15], target: 3, expected: [])
    }

    func testMultipleWaysToReachTarget() {
        verify([1, 2], target: 4, expected: [[1, 1, 1, 1], [1, 1, 2], [2, 2]])
    }

    func testNoDuplicateCombinations() {
        let result = sut.combinationSum([2, 3, 6, 7], 7)
        let unique = Set(result.map { $0.sorted().description })
        XCTAssertEqual(result.count, unique.count)
    }

    func testCandidateReusedMultipleTimes() {
        verify([3], target: 9, expected: [[3, 3, 3]])
    }
}
