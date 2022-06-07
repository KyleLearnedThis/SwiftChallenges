//
//  NumberOfIslandsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/22.
//

import XCTest

class NumberOfIslandsTest: XCTestCase {
    func testBasic01() throws {
        let islands = NumberOfIslands()
        let grid: [[Character]] = [
                ["1","1","1","1","0"],
                ["1","1","0","1","0"],
                ["1","1","0","0","0"],
                ["0","0","0","0","0"],
            ]
        let expected = 1
        let actual = islands.numIslands(grid)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let islands = NumberOfIslands()
        let grid: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"],
        ]
        let expected = 3
        let actual = islands.numIslands(grid)
        XCTAssertEqual(expected, actual)
    }
}
