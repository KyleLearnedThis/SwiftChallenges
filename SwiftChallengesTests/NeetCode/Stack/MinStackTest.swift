//
//  MinStackTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/26.
//

import XCTest

class MinStackTest: XCTestCase {

    // LeetCode example: push/pop sequence from the problem
    func testLeetCodeExample() {
        let ms = MinStack()
        ms.push(-2)
        ms.push(0)
        ms.push(-3)
        XCTAssertEqual(ms.getMin(), -3)
        ms.pop()
        XCTAssertEqual(ms.top(), 0)
        XCTAssertEqual(ms.getMin(), -2)
    }

    // Min updates correctly as smaller values are pushed
    func testMinTracksCorrectly() {
        let ms = MinStack()
        ms.push(5)
        XCTAssertEqual(ms.getMin(), 5)
        ms.push(3)
        XCTAssertEqual(ms.getMin(), 3)
        ms.push(7)
        XCTAssertEqual(ms.getMin(), 3)
        ms.push(1)
        XCTAssertEqual(ms.getMin(), 1)
    }

    // Min is restored after popping the current minimum
    func testMinRestoredAfterPop() {
        let ms = MinStack()
        ms.push(2)
        ms.push(1)
        XCTAssertEqual(ms.getMin(), 1)
        ms.pop()
        XCTAssertEqual(ms.getMin(), 2)
    }

    // Duplicate minimums: popping one copy doesn't lose the min
    func testDuplicateMin() {
        let ms = MinStack()
        ms.push(3)
        ms.push(3)
        XCTAssertEqual(ms.getMin(), 3)
        ms.pop()
        XCTAssertEqual(ms.getMin(), 3)
    }

    // Single element: top and min are the same
    func testSingleElement() {
        let ms = MinStack()
        ms.push(42)
        XCTAssertEqual(ms.top(), 42)
        XCTAssertEqual(ms.getMin(), 42)
    }

    // Negative values
    func testNegativeValues() {
        let ms = MinStack()
        ms.push(-5)
        ms.push(-1)
        ms.push(-10)
        XCTAssertEqual(ms.getMin(), -10)
        ms.pop()
        XCTAssertEqual(ms.getMin(), -5)
    }
}
