//
//  ThreeSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/25/26.
//

import XCTest

class ThreeSumTest: XCTestCase {
    let ts = ThreeSum()
    func testBasic01() {
        let input: [Int] = [-1, 0, 1, 2, -1, -4]
        let expected: [[Int]] = [[-1, -1, 2], [-1, 0, 1]]
        let actual = ts.threeSum(input)
        XCTAssertEqual(actual, expected)
    }
    
    func testBasic02() {
        let input: [Int] = [0,1,1]
        let expected: [[Int]] = []
        let actual = ts.threeSum(input)
        XCTAssertEqual(actual, expected)
    }
    
    func testBasic03() {
        let input: [Int] = [0,0,0]
        let expected: [[Int]] = [[0,0,0]]
        let actual = ts.threeSum(input)
        XCTAssertEqual(actual, expected)
    }
}
