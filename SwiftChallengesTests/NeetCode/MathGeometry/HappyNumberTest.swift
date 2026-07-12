//
//  HappyNumberTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class HappyNumberTest: XCTestCase {

    private let sut = HappyNumber()

    private func verify(_ n: Int, _ expected: Bool, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.isHappy(n), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testOneIsHappy() {
        verify(1, true)
    }

    func testSevenIsHappy() {
        verify(7, true)
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify(19, true)
    }

    func testExample2() {
        verify(2, false)
    }

    // MARK: - Edge cases

    func testFourIsUnhappy() {
        verify(4, false)
    }

    func testLargeUnhappyNumber() {
        verify(11, false)
    }

    func testLargeHappyNumber() {
        verify(100, true)
    }
}
