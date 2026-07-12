//
//  ReverseBitsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class ReverseBitsTest: XCTestCase {

    private let sut = ReverseBits()

    private func verify(_ n: Int, _ expected: Int, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.reverseBits(n), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testZero() {
        verify(0, 0)
    }

    func testOne() {
        verify(1, 2147483648)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(43261596, 964176192)
    }

    func testExample2() {
        verify(4294967293, 3221225471)
    }

    // MARK: - Edge cases

    func testAllBitsSet() {
        verify(4294967295, 4294967295)
    }

    func testHighestBitOnly() {
        verify(2147483648, 1)
    }
}
