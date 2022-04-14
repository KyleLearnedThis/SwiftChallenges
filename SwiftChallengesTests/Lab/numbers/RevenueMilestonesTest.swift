//
//  RevenueMilestonesTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/14/22.
//

import XCTest

class RevenueMilestonesTest: XCTestCase {

    func testBasic01() throws {
        let revenues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        let milestones = [100, 200, 500]
        let days = RevenueMilestones.getMilestoneDays(revenues, milestones)
        let expected = [4, 6, 10]
        XCTAssertEqual(expected, days)
    }

    func testBasic02() throws {
        let revenues = [100, 200, 300, 400, 500]
        let milestones = [300, 800, 1000, 1400]
        let days = RevenueMilestones.getMilestoneDays(revenues, milestones)
        let expected = [2, 4, 4, 5]
        XCTAssertEqual(expected, days)
    }

    func testBasic03() throws {
        let revenues = [700, 800, 600, 400, 600, 700]
        let milestones = [3100, 2200, 800, 2100, 1000]
        let days = RevenueMilestones.getMilestoneDays(revenues, milestones)
        let expected = [5, 4, 2, 3, 2]
        XCTAssertEqual(expected, days)
    }
}
