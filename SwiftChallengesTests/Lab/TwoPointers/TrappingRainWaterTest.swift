//
//  TrappingRainWaterTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/26/26.
//

import XCTest

final class TrappingRainWaterTest: XCTestCase {
    let trapper = TrappingRainWater()

    func testBasic01() {
        let input = [0,1,0,2,1,0,1,3,2,1,2,1]
        let expected: Int = 6
        let actual = trapper.trap(input)
        XCTAssertEqual(actual, expected)
    }
    
    func testBasic02() {
        let input = [4,2,0,3,2,5]
        let expected: Int = 9
        let actual = trapper.trap(input)
        XCTAssertEqual(actual, expected)
    }
}
