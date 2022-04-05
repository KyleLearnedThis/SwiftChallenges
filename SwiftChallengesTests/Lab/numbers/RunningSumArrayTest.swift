//
//  RunningSumArrayTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 1/27/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class RunningSumArrayTest: XCTestCase {

    func testArray01() throws {
        let input = [1,2,3,4]
        let expected = [1,3,6,10]
        let actual = RunningSumArray.runningSum(input)
        XCTAssertEqual(expected, actual)
    }

    func testArray02() throws {
        let input = [1,1,1,1,1]
        let expected = [1,2,3,4,5]
        let actual = RunningSumArray.runningSum(input)
        XCTAssertEqual(expected, actual)
    }

    func testArray03() throws {
        let input = [3,1,2,10,1]
        let expected = [3,4,6,16,17]
        let actual = RunningSumArray.runningSum(input)
        XCTAssertEqual(expected, actual)
    }

}
