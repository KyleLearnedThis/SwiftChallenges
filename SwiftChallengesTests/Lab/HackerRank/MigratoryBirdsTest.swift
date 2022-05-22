//
//  MigratoryBirdsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/22/22.
//

import XCTest

class MigratoryBirdsTest: XCTestCase {
    func testBasic01() throws {
        let input = [1,4,4,4,5,3]
        let expected = 4
        let actual = MigratoryBirds.migratoryBirds(arr: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [1,2,3,4,5,4,3,2,1,3,4]
        let expected = 3
        let actual = MigratoryBirds.migratoryBirds(arr: input)
        XCTAssertEqual(expected, actual)
    }
}
