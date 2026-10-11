//
//  RedundantConnectionTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 10/6/26.
//

import XCTest

class RedundantConnectionTest: XCTestCase {

    private let sut = RedundantConnection()

    private func verify(_ edges: [[Int]], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.findRedundantConnection(edges), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testMinimalTriangle() {
        verify([[1, 2], [2, 3], [3, 1]], [3, 1])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([[1, 2], [1, 3], [2, 3]], [2, 3])
    }

    func testExample2() {
        verify([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]], [1, 4])
    }

    // MARK: - Edge cases

    func testSquareCycleClosedByLastEdge() {
        verify([[1, 2], [2, 3], [3, 4], [4, 1]], [4, 1])
    }

    func testCycleNotIncludingFirstNode() {
        verify([[1, 2], [2, 3], [3, 4], [4, 2], [1, 5]], [4, 2])
    }

    func testRedundantEdgeInMiddle() {
        verify([[1, 4], [3, 4], [1, 3], [1, 2], [4, 5]], [1, 3])
    }

    func testReturnsLastCycleEdgeInInputOrder() {
        verify([[3, 4], [1, 2], [2, 4], [3, 5], [2, 5]], [2, 5])
    }

    func testReversedEndpoints() {
        verify([[2, 1], [3, 1], [3, 2]], [3, 2])
    }
}
