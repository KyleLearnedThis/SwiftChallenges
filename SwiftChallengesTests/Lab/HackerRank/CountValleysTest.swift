//
//  CountValleysTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/24/22.
//

import XCTest

class CountValleysTest: XCTestCase {
    func testBasic01() throws {
        let cv = CountValleys()
        let steps = 8
        let path = "UDDDUDUU"
        let expected = 1
        let actual = cv.countingValleys(steps: steps, path: path)
        XCTAssertEqual(expected, actual)
    }
}
