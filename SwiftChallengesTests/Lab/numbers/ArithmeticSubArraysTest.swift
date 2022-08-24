//
//  ArithmeticSubArraysTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/24/22.
//

import XCTest

class ArithmeticSubArraysTest: XCTestCase {
    func testBasic01() throws {
        let nums = [4,6,5,9,3,7]
        let l = [0,0,2]
        let r = [2,3,5]
        let expected = [true,false,true]
        let actual = ArithmeticSubArrays.checkArithmeticSubarrays(nums,l,r)
        XCTAssertEqual(expected, actual)
    }
}
