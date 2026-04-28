//
//  FindDuplicateNumberTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/27/26.
//

import XCTest

class FindDuplicateNumberTest: XCTestCase {
    let solution = FindDuplicateNumber()

    func testBasicDuplicate() {
        XCTAssertEqual(solution.findDuplicate([1, 3, 4, 2, 2]), 2)
    }

    func testDuplicateAtEnd() {
        XCTAssertEqual(solution.findDuplicate([3, 1, 3, 4, 2]), 3)
    }

    func testDuplicateIsOne() {
        XCTAssertEqual(solution.findDuplicate([1, 1]), 1)
    }

    func testDuplicateAppearsMoreThanTwice() {
        XCTAssertEqual(solution.findDuplicate([2, 2, 2, 2, 2]), 2)
    }

    func testLargerInput() {
        XCTAssertEqual(solution.findDuplicate([1, 2, 3, 4, 5, 3]), 3)
    }
}
