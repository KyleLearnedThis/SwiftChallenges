//
//  LargestRectangleHistogramTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/26.
//

import XCTest

class LargestRectangleHistogramTest: XCTestCase {

    // LeetCode example 1: [2,1,5,6,2,3] -> 10
    func testLeetCodeExample1() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([2, 1, 5, 6, 2, 3]), 10)
    }

    // LeetCode example 2: [2,4] -> 4
    func testLeetCodeExample2() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([2, 4]), 4)
    }

    // Single bar: [5] -> 5
    func testSingleBar() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([5]), 5)
    }

    // All same height: [3,3,3] -> 9
    func testAllSameHeight() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([3, 3, 3]), 9)
    }

    // Descending heights: [5,4,3,2,1] -> 9
    func testDescending() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([5, 4, 3, 2, 1]), 9)
    }

    // Ascending heights: [1,2,3,4,5] -> 9
    func testAscending() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([1, 2, 3, 4, 5]), 9)
    }

    // Zero height bar breaks rectangle: [1,0,1] -> 1
    func testZeroHeightBar() {
        let sut = LargestRectangleHistogram()
        XCTAssertEqual(sut.largestRectangleArea([1, 0, 1]), 1)
    }
}
