//
//  BattleShipTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/24/22.
//

import XCTest
@testable import SwiftChallenges

class BattleShipTest: XCTestCase {
    func testBasic01() throws {
        let board = [["X",".",".","X"],[".",".",".","X"],[".",".",".","X"]]
        let expected = 2
        let actual = BattleShip.countBattleships(board)
        XCTAssertEqual(expected, actual)
    }
}
