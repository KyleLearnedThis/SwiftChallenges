//
//  SumOfTwoIntegersTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class SumOfTwoIntegersTest: XCTestCase {

    private let sut = SumOfTwoIntegers()

    private func verify(_ a: Int, _ b: Int, _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.getSum(a, b), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testZeroPlusZero() {
        verify(0, 0, 0)
    }

    func testZeroPlusPositive() {
        verify(0, 5, 5)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(1, 2, 3)
    }

    func testExample2() {
        verify(2, 3, 5)
    }

    // MARK: - Edge cases

    func testNegativeNumbers() {
        verify(-1, -2, -3)
    }

    func testPositiveAndNegative() {
        verify(-5, 5, 0)
    }

    func testUpperBoundaryValues() {
        verify(1000, 1000, 2000)
    }

    func testLowerBoundaryValues() {
        verify(-1000, -1000, -2000)
    }
}
