//
//  TwoSum2Test.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/25/26.
//

import XCTest

class TwoSum2Test: XCTestCase {
    let twoSum2 = TwoSum2()
    func testBasic01() {
        let input = [2,7,11,15]
        let target = 9
        let expected: [Int] = [1,2]
        let actual = twoSum2.twoSum(input, target)
        XCTAssertEqual(actual, expected)
    }

    func testBasic02() {
        let input = [2,3,4]
        let target = 6
        let expected: [Int] = [1,3]
        let actual = twoSum2.twoSum(input, target)
        XCTAssertEqual(actual, expected)
    }

    func testBasic03() {
        let input = [-1,0]
        let target = -1
        let expected: [Int] = [1,2]
        let actual = twoSum2.twoSum(input, target)
        XCTAssertEqual(actual, expected)
    }
    
}
