//
//  HurdleRaceTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/24/22.
//

import XCTest

class HurdleRaceTest: XCTestCase {
    func testBasic01() throws {
        let hr = HurdleRace()
        let input = [1,6,3,5,2]
        let k = 4
        let expected = 2
        let actual = hr.hurdleRace(k: k, height: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let hr = HurdleRace()
        let input = [2,5,4,5,2]
        let k = 7
        let expected = 0
        let actual = hr.hurdleRace(k: k, height: input)
        XCTAssertEqual(expected, actual)
    }
}
