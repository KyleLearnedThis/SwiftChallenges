//
//  MaxProfitTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/19/26.
//

import XCTest

class MaxProfitTest: XCTestCase {
    let mp = MaxProfit()

    func testBasic01() {
        let input = [7,1,5,3,6,4]
        let output = 5
        let actual = mp.maxProfit(input)
        XCTAssertEqual(actual, output, "Output mismatch output: \(input), actual: \(actual)")
    }
    
    func testBasic02() {
        let input = [7,6,4,3,1]
        let output = 0
        let actual = mp.maxProfit(input)
        XCTAssertEqual(actual, output, "Output mismatch output: \(input), actual: \(actual)")
    }
}
