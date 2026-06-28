//
//  MinimumHeightTreesTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/24/26.
//

import XCTest

class MinimumHeightTreesTest: XCTestCase {

    private let sut = MinimumHeightTrees()

    private func verify(_ n: Int, _ edges: [[Int]], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        let result = sut.findMinHeightTrees(n, edges)
        XCTAssertEqual(Set(result), Set(expected), file: file, line: line)
        XCTAssertEqual(result.count, expected.count, file: file, line: line)
    }

    // MARK: - Base cases

    func testSingleNode() {
        verify(1, [], [0])
    }

    func testTwoNodes() {
        verify(2, [[0, 1]], [0, 1])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(4, [[1, 0], [1, 2], [1, 3]], [1])
    }

    func testExample2() {
        verify(6, [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]], [3, 4])
    }

    // MARK: - Edge cases

    func testStraightLine() {
        verify(4, [[0, 1], [1, 2], [2, 3]], [1, 2])
    }

    func testStarShape() {
        verify(5, [[0, 1], [0, 2], [0, 3], [0, 4]], [0])
    }

    func testThreeNodesLine() {
        verify(3, [[0, 1], [1, 2]], [1])
    }
}
