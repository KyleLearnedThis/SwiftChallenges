//
//  LongestConsecutiveTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/18/26.
//

import XCTest

class LongestConsecutiveTest: XCTestCase {
    let lc = LongestConsecutive()
    func testBasic01() throws {
        let input = [100,4,200,1,3,2]
        let expected = 4
        let actual = lc.longestConsecutive(input)
        XCTAssertEqual(expected, actual)
    }
    
    func testBasic02() throws {
        let input = [0,3,7,2,5,8,4,6,0,1]
        let expected = 9
        let actual = lc.longestConsecutive(input)
        XCTAssertEqual(expected, actual)
    }
}
