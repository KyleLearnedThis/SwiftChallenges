//
//  BinarySearchTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/27/26.
//

import XCTest

class BinarySearchTest: XCTestCase {
    let binarySearch = BinarySearch()

    func testTargetInMiddle() {
        let nums = [-1, 0, 3, 5, 9, 12]
        XCTAssertEqual(binarySearch.search(nums, 9), 4)
    }

    func testTargetNotFound() {
        let nums = [-1, 0, 3, 5, 9, 12]
        XCTAssertEqual(binarySearch.search(nums, 2), -1)
    }

    func testTargetAtStart() {
        let nums = [1, 3, 5, 7, 9]
        XCTAssertEqual(binarySearch.search(nums, 1), 0)
    }

    func testTargetAtEnd() {
        let nums = [1, 3, 5, 7, 9]
        XCTAssertEqual(binarySearch.search(nums, 9), 4)
    }

    func testSingleElementFound() {
        XCTAssertEqual(binarySearch.search([5], 5), 0)
    }

    func testSingleElementNotFound() {
        XCTAssertEqual(binarySearch.search([5], 3), -1)
    }
}
