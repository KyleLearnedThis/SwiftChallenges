//
//  MineSweeperTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 9/7/22.
//

import XCTest

class MineSweeperTest: XCTestCase {
    func testBasic01() throws {
        let input = [[true,false,false,true],
                     [false,false,true,false],
                     [true,true,false,true]]
        let expected = [[0,2,2,1],
                        [3,4,3,3],
                        [1,2,3,1]]
        let actual = MineSweeper.generateMatrix(matrix: input)
        XCTAssertEqual(expected, actual)
    }
}
