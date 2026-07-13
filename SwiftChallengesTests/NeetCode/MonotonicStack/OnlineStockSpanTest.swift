//
//  OnlineStockSpanTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/26.
//

import XCTest

class OnlineStockSpanTest: XCTestCase {

    // Feeds prices into a fresh spanner in order and compares the spans.
    // A new instance per call keeps the stateful sut isolated between cases.
    private func verify(_ prices: [Int], _ expected: [Int], file: StaticString = #filePath, line: UInt = #line) {
        let sut = OnlineStockSpan()
        let spans = prices.map { sut.next($0) }
        XCTAssertEqual(spans, expected, file: file, line: line)
    }

    // MARK: - Base cases

    func testSinglePrice() {
        verify([100], [1])
    }

    // MARK: - LeetCode examples

    func testExample1() {
        verify([100, 80, 60, 70, 60, 75, 85], [1, 1, 1, 2, 1, 4, 6])
    }

    // MARK: - Edge cases

    func testStrictlyIncreasing() {
        verify([10, 20, 30, 40], [1, 2, 3, 4])
    }

    func testStrictlyDecreasing() {
        verify([40, 30, 20, 10], [1, 1, 1, 1])
    }

    func testAllEqual() {
        verify([50, 50, 50], [1, 2, 3])
    }

    func testDuplicatesAndDips() {
        verify([31, 41, 48, 59, 79], [1, 2, 3, 4, 5])
    }
}
