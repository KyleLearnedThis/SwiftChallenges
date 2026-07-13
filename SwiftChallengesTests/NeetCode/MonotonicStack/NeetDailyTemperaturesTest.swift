//
//  NeetDailyTemperaturesTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class NeetDailyTemperaturesTest: XCTestCase {

    private let sut = NeetDailyTemperatures()

    private func verify(_ temperatures: [Int], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.dailyTemperatures(temperatures), expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testEmpty() {
        verify([], [])
    }

    func testSingleElement() {
        verify([30], [0])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([73, 74, 75, 71, 69, 72, 76, 73], [1, 1, 4, 2, 1, 1, 0, 0])
    }

    func testExample2() {
        verify([30, 40, 50, 60], [1, 1, 1, 0])
    }

    func testExample3() {
        verify([30, 60, 90], [1, 1, 0])
    }

    // MARK: - Edge cases

    func testAllDescending() {
        verify([90, 80, 70], [0, 0, 0])
    }

    func testAllEqual() {
        verify([50, 50, 50], [0, 0, 0])
    }
}
