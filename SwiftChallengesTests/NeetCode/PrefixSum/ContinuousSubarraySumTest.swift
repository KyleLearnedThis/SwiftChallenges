//
//  ContinuousSubarraySumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/2/26.
//

import XCTest

class ContinuousSubarraySumTest: XCTestCase {
    let solution = ContinuousSubarraySum()

    // [2, 4] sums to 6, which is divisible by 6
    func testExample1() {
        XCTAssertTrue(solution.checkSubarraySum([23, 2, 4, 6, 7], 6))
    }

    // [2, 6, 4, 7] sums to 19... actually [6, 4, 7] = 17... [23, 2, 6] = 31... [2, 6, 4] = 12, divisible by 6
    func testExample2() {
        XCTAssertTrue(solution.checkSubarraySum([23, 2, 6, 4, 7], 6))
    }

    // No subarray of length >= 2 sums to a multiple of 13
    func testNoMatch() {
        XCTAssertFalse(solution.checkSubarraySum([23, 2, 6, 4, 7], 13))
    }

    // Minimum valid case: [1, 5] sums to 6, divisible by 6
    func testTwoElementsMatch() {
        XCTAssertTrue(solution.checkSubarraySum([1, 5], 6))
    }

    // [1, 5] sums to 6, not divisible by 4
    func testTwoElementsNoMatch() {
        XCTAssertFalse(solution.checkSubarraySum([1, 5], 4))
    }

    // [0, 0] sums to 0, which is divisible by any k (0 % k == 0)
    func testAllZeros() {
        XCTAssertTrue(solution.checkSubarraySum([0, 0], 5))
    }

    // k == 1: every integer is divisible by 1, so any subarray of length >= 2 qualifies
    func testKEqualsOne() {
        XCTAssertTrue(solution.checkSubarraySum([1, 2, 3], 1))
    }

    // k larger than the total sum — no subarray can reach a multiple of 100
    func testLargeK() {
        XCTAssertFalse(solution.checkSubarraySum([1, 2], 100))
    }

    // [1, 5, 3] = 9, [5, 3] = 8 — match is not at the start or end
    func testMatchInMiddle() {
        XCTAssertTrue(solution.checkSubarraySum([1, 5, 3, 2, 7], 8))
    }

    // [1, 2, 3] sums to exactly k=6, the whole array is the matching subarray
    func testExactSumEqualsK() {
        XCTAssertTrue(solution.checkSubarraySum([1, 2, 3], 6))
    }
}
