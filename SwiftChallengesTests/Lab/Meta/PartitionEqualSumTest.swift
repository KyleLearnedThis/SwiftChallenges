//
//  PartitionEqualSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/1/22.
//

import XCTest

class PartitionEqualSumTest: XCTestCase {
    func testBasicV01_01() throws {
        let input = [1, 5, 7, 1]
        let expected = true
        let actual = PartitionEqualSum.canPartition(input)
        XCTAssertEqual(actual, expected)
    }

    func testBasicV01_02() throws {
        let input = [12, 7, 6, 7, 6]
        let expected = false
        let actual = PartitionEqualSum.canPartition(input)
        XCTAssertEqual(actual, expected)
    }

    func testBasicV02_01() throws {
        let input = [1, 5, 7, 1]
        let expected = true
        let actual = PartitionEqualSum.canPartitionV2(input)
        XCTAssertEqual(actual, expected)
    }

    func testBasicV02_02() throws {
        let input = [3, 6, 3, 4, 4]
        let expected = false
        let actual = PartitionEqualSum.canPartitionV2(input)
        XCTAssertEqual(actual, expected)
    }

    func testBasicV02_03() throws {
        let input = [12, 7, 6, 7, 6]
        let expected = false
        let actual = PartitionEqualSum.canPartitionV2(input)
        XCTAssertEqual(actual, expected)
    }
}
