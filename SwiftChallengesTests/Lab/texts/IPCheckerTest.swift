//
//  IPCheckerTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/22/22.
//

import XCTest

class IPCheckerTest: XCTestCase {
    func testInvalidBasic01() {
        let input = "1"
        let expected = false
        let actual = IPChecker.isValidIPV4(inputString: input)
        XCTAssertEqual(expected, actual)
    }

    func testInvalidBasic02() {
        let input = "1.1.1.1a"
        let expected = false
        let actual = IPChecker.isValidIPV4(inputString: input)
        XCTAssertEqual(expected, actual)
    }

    func testBasic01() {
        let input = "172.16.254.1"
        let expected = true
        let actual = IPChecker.isValidIPV4(inputString: input)
        XCTAssertEqual(expected, actual)
    }

    func testFoo() {
        let input = "01"
        let x = Int(input)!
        print("===== x: \(x) =====")
    }
}
