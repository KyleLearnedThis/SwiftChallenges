//
//  NeetWordSearchTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/19/26.
//

import XCTest

class NeetWordSearchTest: XCTestCase {

    private let sut = NeetWordSearch()

    private func verify(_ board: [[Character]], _ word: String, file: StaticString = #filePath, line: UInt = #line) -> Bool {
        sut.exist(board, word)
    }

    // MARK: - Base cases

    func testSingleCellMatch() {
        XCTAssertTrue(verify([["A"]], "A"))
    }

    func testSingleCellNoMatch() {
        XCTAssertFalse(verify([["A"]], "B"))
    }

    func testWordLongerThanBoard() {
        XCTAssertFalse(verify([["A", "B"], ["C", "D"]], "ABCDE"))
    }

    // MARK: - LeetCode examples

    func testExample1() {
        let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        XCTAssertTrue(verify(board, "ABCCED"))
    }

    func testExample2() {
        let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        XCTAssertTrue(verify(board, "SEE"))
    }

    func testExample3() {
        let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        XCTAssertFalse(verify(board, "ABCB"))
    }

    // MARK: - Edge cases

    func testWordNotInBoard() {
        // "ABCD": A→B is fine, but B's only unvisited neighbor is D, not C — no path exists
        XCTAssertFalse(verify([["A","B"],["C","D"]], "ABCD"))
    }

    func testNoCellReuse() {
        XCTAssertFalse(verify([["A","A"]], "AAA"))
    }

    func testSingleRowWord() {
        XCTAssertTrue(verify([["A","B","C"]], "ABC"))
    }

    func testWordInReverse() {
        XCTAssertTrue(verify([["A","B","C"]], "CBA"))
    }
}
