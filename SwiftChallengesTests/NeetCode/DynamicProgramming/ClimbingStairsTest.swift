//
//  ClimbingStairsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/30/26.
//

import XCTest

class ClimbingStairsTest: XCTestCase {

    private let sut = ClimbingStairs()

    private func verify(_ n: Int, _ expected: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(sut.climbStairs(n), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testN1() {
        verify(1, 1)
    }

    func testN2() {
        verify(2, 2)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(2, 2)
    }

    func testExample2() {
        verify(3, 3)
    }

    // MARK: - Edge cases

    func testN4() {
        verify(4, 5)
    }

    func testN5() {
        verify(5, 8)
    }

    func testN10() {
        verify(10, 89)
    }

    func testN45() {
        verify(45, 1836311903)
    }
}
