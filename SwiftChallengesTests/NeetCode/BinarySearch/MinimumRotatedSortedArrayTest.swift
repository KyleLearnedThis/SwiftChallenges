//
//  MinimumRotatedSortedArrayTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/30/26.
//

import XCTest

class MinimumRotatedSortedArrayTest: XCTestCase {
    var sut: MinimumRotatedSortedArray!

    override func setUp() {
        super.setUp()
        sut = MinimumRotatedSortedArray()
    }

    // Minimum is at the pivot (classic rotation)
    func test_minimumAtPivot() {
        XCTAssertEqual(sut.findMin([3, 4, 5, 1, 2]), 1)
    }

    // Minimum is at index 0 after rotation by one step
    func test_minimumAtStart() {
        XCTAssertEqual(sut.findMin([1, 2, 3, 4, 5]), 1)
    }

    // Minimum is the last element (rotated by one step left)
    func test_minimumAtEnd() {
        XCTAssertEqual(sut.findMin([2, 3, 4, 5, 1]), 1)
    }

    // Single element array
    func test_singleElement() {
        XCTAssertEqual(sut.findMin([7]), 7)
    }

    // Two elements, rotated
    func test_twoElementsRotated() {
        XCTAssertEqual(sut.findMin([2, 1]), 1)
    }

    // Two elements, not rotated
    func test_twoElementsNotRotated() {
        XCTAssertEqual(sut.findMin([1, 2]), 1)
    }

    // No rotation (already sorted)
    func test_noRotation() {
        XCTAssertEqual(sut.findMin([1, 2, 3, 4, 5, 6, 7]), 1)
    }

    // Minimum is in the middle
    func test_minimumInMiddle() {
        XCTAssertEqual(sut.findMin([6, 7, 1, 2, 3, 4, 5]), 1)
    }

    // Large rotation, minimum near end
    func test_largeRotation() {
        XCTAssertEqual(sut.findMin([4, 5, 6, 7, 0, 1, 2]), 0)
    }

    // Negative numbers present
    func test_negativeNumbers() {
        XCTAssertEqual(sut.findMin([0, 1, 2, -4, -3, -2, -1]), -4)
    }
}
