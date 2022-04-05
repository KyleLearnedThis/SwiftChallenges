//
//  DegreeOfArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 3/16/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import XCTest

class DegreeOfArrayTest: XCTestCase {
    func testBasic01() throws {
        let input = [1,2,2,3,1,4,2]
        let expected = 6
        let actual = DegreeOfArray.findShortestSubArray(input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [1,2,2,3,1]
        let expected = 2
        let actual = DegreeOfArray.findShortestSubArray(input)
        XCTAssertEqual(expected, actual)
    }
}
