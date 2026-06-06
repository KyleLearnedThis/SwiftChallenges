//
//  SubarraySumEqualsKTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/5/26.
//

import XCTest

class SubarraySumEqualsKTest: XCTestCase {
    let solution = SubarraySumEqualsK()

    // LeetCode example 1: [1,1,1], k=2 → subarrays [1,1] at index 0-1 and 1-2
    func testExample1() {
        XCTAssertEqual(solution.subarraySum([1, 1, 1], 2), 2)
    }

    // LeetCode example 2: [1,2,3], k=3 → [1,2] and [3]
    func testExample2() {
        XCTAssertEqual(solution.subarraySum([1, 2, 3], 3), 2)
    }

    // Single element equals k
    func testSingleElementMatch() {
        XCTAssertEqual(solution.subarraySum([5], 5), 1)
    }

    // Single element does not equal k
    func testSingleElementNoMatch() {
        XCTAssertEqual(solution.subarraySum([3], 5), 0)
    }

    // Entire array sums to k
    func testWholeArraySumsToK() {
        XCTAssertEqual(solution.subarraySum([1, 2, 3, 4], 10), 1)
    }

    // No valid subarray
    func testNoMatch() {
        XCTAssertEqual(solution.subarraySum([1, 2, 3], 7), 0)
    }

    // Negative numbers: [-1, -1, 1], k=0 → [-1,1] at indices 1-2 and 0-2 → wait: [-1,1]=-1+1+...
    // [-1,-1,1]: prefix sums: 0,-1,-2,-1. k=0: need same prefix sum twice. -1 appears at i=1 and i=3 → 1 subarray [-1,1]... and 0 appears at i=0 and... no. Count=1
    func testNegativeNumbers() {
        XCTAssertEqual(solution.subarraySum([-1, -1, 1], 0), 1)
    }

    // All zeros with k=0: every subarray sums to 0, n=3 → 6 subarrays
    func testAllZerosKZero() {
        XCTAssertEqual(solution.subarraySum([0, 0, 0], 0), 6)
    }

    // Mixed positive and negative, multiple matches
    func testMixedSignsMultipleMatches() {
        XCTAssertEqual(solution.subarraySum([3, 4, -7, 3, 1, 3, 1, -4, -2, -2], 0), 6)
    }

    // k is negative: [1,-1,-1,2], k=-1 → [-1] at index 1, [-1] at index 2, [1,-1,-1] → sum=-1
    func testNegativeK() {
        XCTAssertEqual(solution.subarraySum([1, -1, -1, 2], -1), 3)
    }
}
