//
//  NQueensTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/19/26.
//

import XCTest

class NQueensTest: XCTestCase {

    private let sut = NQueens()

    private func sorted(_ boards: [[String]]) -> [[String]] {
        boards.sorted { $0.joined() < $1.joined() }
    }

    private func verify(_ n: Int, expected: [[String]], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sorted(sut.solveNQueens(n)), sorted(expected), file: file, line: line)
    }

    // MARK: - Base cases

    func testN1() {
        verify(1, expected: [["Q"]])
    }

    func testN2NoSolution() {
        verify(2, expected: [])
    }

    func testN3NoSolution() {
        verify(3, expected: [])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(4, expected: [
            [".Q..","...Q","Q...","..Q."],
            ["..Q.","Q...","...Q",".Q.."]
        ])
    }

    // MARK: - Edge cases

    func testN4Count() {
        XCTAssertEqual(sut.solveNQueens(4).count, 2)
    }

    func testN5Count() {
        XCTAssertEqual(sut.solveNQueens(5).count, 10)
    }

    func testN6Count() {
        XCTAssertEqual(sut.solveNQueens(6).count, 4)
    }

    func testN8Count() {
        XCTAssertEqual(sut.solveNQueens(8).count, 92)
    }

    func testBoardDimensions() {
        let result = sut.solveNQueens(4)
        for board in result {
            XCTAssertEqual(board.count, 4)
            for row in board {
                XCTAssertEqual(row.count, 4)
            }
        }
    }

    func testEachRowHasExactlyOneQueen() {
        for board in sut.solveNQueens(5) {
            for row in board {
                XCTAssertEqual(row.filter { $0 == "Q" }.count, 1)
            }
        }
    }
}
