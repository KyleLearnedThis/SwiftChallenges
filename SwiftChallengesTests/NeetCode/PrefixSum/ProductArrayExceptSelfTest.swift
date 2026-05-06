//
//  ProductArrayExceptSelfTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/5/26.
//

import XCTest

final class ProductArrayExceptSelfTest: XCTestCase {
    let solution = ProductArrayExceptSelf()

    func testBasic01() {
        let input = [1, 2, 3, 4]
        let expected = [24, 12, 8, 6]
        let actual = solution.productExceptSelf(input)
        XCTAssertEqual(actual, expected)
    }

    func testBasic02() {
        let input = [-1, 1, 0, -3, 3]
        let expected = [0, 0, 9, 0, 0]
        let actual = solution.productExceptSelf(input)
        XCTAssertEqual(actual, expected)
    }

    func testSingleZero() {
        let input = [1, 2, 0, 4]
        let expected = [0, 0, 8, 0]
        let actual = solution.productExceptSelf(input)
        XCTAssertEqual(actual, expected)
    }

    func testTwoZeros() {
        let input = [1, 0, 0, 4]
        let expected = [0, 0, 0, 0]
        let actual = solution.productExceptSelf(input)
        XCTAssertEqual(actual, expected)
    }

    func testTwoElements() {
        let input = [3, 4]
        let expected = [4, 3]
        let actual = solution.productExceptSelf(input)
        XCTAssertEqual(actual, expected)
    }

    func testNegativeNumbers() {
        let input = [-2, -3, -4]
        let expected = [12, 8, 6]
        let actual = solution.productExceptSelf(input)
        XCTAssertEqual(actual, expected)
    }
}
