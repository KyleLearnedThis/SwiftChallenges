//
//  SearchRotatedSortedArrayTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/27/26.
//

import XCTest

class SearchRotatedSortedArrayTest: XCTestCase {
    var sut: SearchRotatedSortedArray!

    override func setUp() {
        super.setUp()
        sut = SearchRotatedSortedArray()
    }

    // Target found in left sorted half
    func test_targetInLeftHalf() {
        XCTAssertEqual(sut.search([4, 5, 6, 7, 0, 1, 2], 4), 0)
    }

    // Target found in right sorted half
    func test_targetInRightHalf() {
        XCTAssertEqual(sut.search([4, 5, 6, 7, 0, 1, 2], 1), 5)
    }

    // Target not in array
    func test_targetNotFound() {
        XCTAssertEqual(sut.search([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }

    // Single element matches target
    func test_singleElementFound() {
        XCTAssertEqual(sut.search([1], 1), 0)
    }

    // Single element does not match
    func test_singleElementNotFound() {
        XCTAssertEqual(sut.search([1], 0), -1)
    }

    // No rotation (sorted array), target present
    func test_noRotationTargetFound() {
        XCTAssertEqual(sut.search([1, 2, 3, 4, 5], 3), 2)
    }

    // No rotation, target absent
    func test_noRotationTargetNotFound() {
        XCTAssertEqual(sut.search([1, 2, 3, 4, 5], 6), -1)
    }

    // Target is the pivot (smallest element)
    func test_targetAtPivot() {
        XCTAssertEqual(sut.search([6, 7, 1, 2, 3, 4, 5], 1), 2)
    }

    // Target at last index
    func test_targetAtEnd() {
        XCTAssertEqual(sut.search([3, 4, 5, 1, 2], 2), 4)
    }

    // Two-element array, rotated
    func test_twoElementsRotated() {
        XCTAssertEqual(sut.search([2, 1], 1), 1)
    }

    // Two-element array, target first
    func test_twoElementsFirstMatch() {
        XCTAssertEqual(sut.search([2, 1], 2), 0)
    }

    // Negative numbers present
    func test_negativeNumbers() {
        XCTAssertEqual(sut.search([3, 4, 5, -2, -1, 0], -1), 4)
    }
}
