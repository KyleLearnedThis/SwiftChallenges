//
//  ContainerWithMostWaterTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/26/26.
//

import XCTest

class ContainerWithMostWaterTest: XCTestCase {
    let cwmwt = ContainerWithMostWater()
    func testBasic01() {
        let input: [Int] = [1,8,6,2,5,4,8,3,7]
        let expected: Int = 49
        let result = cwmwt.maxArea(input)
        XCTAssertEqual(result, expected)
    }
    
    func testBasic02() {
        let input: [Int] = [1,1]
        let expected: Int = 1
        let result = cwmwt.maxArea(input)
        XCTAssertEqual(result, expected)
    }

    func testBruteForce01() {
        let input: [Int] = [1,8,6,2,5,4,8,3,7]
        let expected: Int = 49
        let result = cwmwt.maxAreaBasic(input)
        XCTAssertEqual(result, expected)
    }
}
