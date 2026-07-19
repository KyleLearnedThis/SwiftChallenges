//
//  PowXNTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/13/26.
//

import XCTest

class PowXNTest: XCTestCase {

    private let sut = PowXN()

    private func verify(
        _ x: Double,
        _ n: Int,
        _ expected: Double,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertEqual(sut.myPow(x, n), expected, accuracy: 1e-5, file: file, line: line)
    }

    // MARK: - Base cases

    func testExponentZero() {
        verify(2.0, 0, 1.0)
    }

    func testExponentOne() {
        verify(2.0, 1, 2.0)
    }

    func testBaseOne() {
        verify(1.0, 100, 1.0)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(2.0, 10, 1024.0)
    }

    func testExample2() {
        verify(2.1, 3, 9.261)
    }

    func testExample3() {
        verify(2.0, -2, 0.25)
    }

    // MARK: - Edge cases

    func testNegativeExponent() {
        verify(2.0, -10, 1.0 / 1024.0)
    }

    func testNegativeBaseEvenExponent() {
        verify(-2.0, 2, 4.0)
    }

    func testNegativeBaseOddExponent() {
        verify(-2.0, 3, -8.0)
    }

    func testIntMinExponent() {
        verify(1.0, Int.min, 1.0)
    }
}
