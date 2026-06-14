//
//  PacificAtlanticWaterFlowTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/14/26.
//

import XCTest

class PacificAtlanticWaterFlowTest: XCTestCase {

    private let sut = PacificAtlanticWaterFlow()

    private lazy var solutions: [([[Int]]) -> [[Int]]] = [
        sut.pacificAtlantic,
        sut.pacificAtlanticDFS
    ]

    private func sorted(_ cells: [[Int]]) -> [[Int]] {
        cells.sorted { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] < $1[1] }
    }

    private func verify(_ heights: [[Int]], expected: [[Int]], file: StaticString = #file, line: UInt = #line) {
        for solve in solutions {
            XCTAssertEqual(sorted(solve(heights)), expected, file: (file), line: line)
        }
    }

    // MARK: - Base cases

    func testSingleCell() {
        verify([[1]], expected: [[0, 0]])
    }

    func testEmptyGrid() {
        verify([], expected: [])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        let heights = [
            [1, 2, 2, 3, 5],
            [3, 2, 3, 4, 4],
            [2, 4, 5, 3, 1],
            [6, 7, 1, 4, 5],
            [5, 1, 1, 2, 4]
        ]
        verify(heights, expected: [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]])
    }

    // MARK: - Single row / single column

    func testSingleRow() {
        // A 1-row grid touches both Pacific (top) and Atlantic (bottom), so all cells qualify.
        verify([[1, 2, 3]], expected: [[0, 0], [0, 1], [0, 2]])
    }

    func testSingleColumn() {
        // A 1-column grid touches both Pacific (left) and Atlantic (right), so all cells qualify.
        verify([[1], [2], [3]], expected: [[0, 0], [1, 0], [2, 0]])
    }

    // MARK: - Uniform height

    func testAllSameHeight() {
        // Flat grid: water can flow freely in any direction, so every cell reaches both oceans.
        verify([[3, 3], [3, 3]], expected: [[0, 0], [0, 1], [1, 0], [1, 1]])
    }

    // MARK: - Monotone grids

    func testDecreasingGrid() {
        // Heights decrease toward bottom-right, so only top row and left column
        // can drain to Pacific without passing through lower terrain on the way to Atlantic.
        let heights = [
            [4, 3, 2],
            [3, 2, 1],
            [2, 1, 0]
        ]
        verify(heights, expected: [[0, 0], [0, 1], [0, 2], [1, 0], [2, 0]])
    }

    func testIncreasingGrid() {
        // Heights increase toward bottom-right, so only bottom row and right column
        // can drain to Atlantic without passing through lower terrain on the way to Pacific.
        let heights = [
            [0, 1, 2],
            [1, 2, 3],
            [2, 3, 4]
        ]
        verify(heights, expected: [[0, 2], [1, 2], [2, 0], [2, 1], [2, 2]])
    }
}
