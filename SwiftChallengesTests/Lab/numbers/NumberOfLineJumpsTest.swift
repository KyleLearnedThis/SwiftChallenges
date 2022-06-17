//
//  NumberOfLineJumpsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/13/22.
//

import XCTest

class NumberOfLineJumpsTest: XCTestCase {
    func testBasic01() throws {
        let kangaroo = NumberOfLineJumps()
        let input = [0,3,4,2]
        let expected = "YES"
        let actual = kangaroo.kangaroo(x1: input[0], v1: input[1], x2: input[2], v2: input[3])
        XCTAssertEqual(expected, actual)
    }
}
