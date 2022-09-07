//
//  ChessBoardCellColorTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/7/22.
//

import XCTest

class ChessBoardCellColorTest: XCTestCase {
    func testBasic01() {
        let cell1 = "A1"
        let cell2 = "B2"
        let expected = true
        let actual = ChessBoardCellColor.sameColor(cell1: cell1, cell2: cell2)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() {
        let cell1 = "A1"
        let cell2 = "H3"
        let expected = false
        let actual = ChessBoardCellColor.sameColor(cell1: cell1, cell2: cell2)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() {
        let cell1 = "B3"
        let cell2 = "H8"
        let expected = false
        let actual = ChessBoardCellColor.sameColor(cell1: cell1, cell2: cell2)
        XCTAssertEqual(expected, actual)
    }

    func testBasic04() {
        let cell1 = "A1"
        let cell2 = "A2"
        let expected = false
        let actual = ChessBoardCellColor.sameColor(cell1: cell1, cell2: cell2)
        XCTAssertEqual(expected, actual)
    }
}
