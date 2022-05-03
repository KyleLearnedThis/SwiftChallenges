//
//  MaximumPopulationYearTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/2/22.
//

import XCTest

class MaximumPopulationYearTest: XCTestCase {
    var mpy = MaximumPopulationYear()
    func testBasic01() throws {
        let logs = [[1993,1999],[2000,2010]]
        let expected = 1993
        let actual = mpy.maximumPopulation(logs)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let logs = [[1950,1961],[1960,1971],[1970,1981]]
        let expected = 1960
        let actual = mpy.maximumPopulation(logs)
        XCTAssertEqual(expected, actual)
    }


    func testMinBirth() throws {
        let logs = [[1993,1999],[2000,2010]]
        let expected = 1993
        let actual = mpy.minBirthYear(logs)
        XCTAssertEqual(expected, actual)
    }

    func testMaxDeath() throws {
        let logs = [[1993,1999],[2000,2010]]
        let expected = 2010
        let actual = mpy.maxDeathYear(logs)
        XCTAssertEqual(expected, actual)
    }
}
