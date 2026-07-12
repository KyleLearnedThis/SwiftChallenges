//
//  NumberOf1BitsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class NumberOf1BitsTest: XCTestCase {

    private let sut = NumberOf1Bits()

    private func verify(_ n: Int, _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.hammingWeight(n), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testZero() {
        verify(0, 0)
    }

    func testSingleBit() {
        verify(1, 1)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(11, 3)
    }

    func testExample2() {
        verify(128, 1)
    }

    func testExample3() {
        verify(2147483645, 30)
    }

    // MARK: - Edge cases

    func testAllBitsSet() {
        verify(2147483647, 31)
    }

    func testPowerOfTwo() {
        verify(1024, 1)
    }
}
