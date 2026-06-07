//
//  NextGreaterElementITest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/26.
//

import XCTest

class NextGreaterElementITest: XCTestCase {

    // LeetCode example 1: nums1=[4,1,2], nums2=[1,3,4,2] -> [-1,3,-1]
    func testLeetCodeExample1() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([4, 1, 2], [1, 3, 4, 2]), [-1, 3, -1])
    }

    // LeetCode example 2: nums1=[2,4], nums2=[1,2,3,4] -> [3,-1]
    func testLeetCodeExample2() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([2, 4], [1, 2, 3, 4]), [3, -1])
    }

    // Single element with no greater element: nums1=[5], nums2=[5] -> [-1]
    func testSingleElementNoGreater() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([5], [5]), [-1])
    }

    // Single element with greater element: nums1=[1], nums2=[1,2] -> [2]
    func testSingleElementWithGreater() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([1], [1, 2]), [2])
    }

    // All elements in nums2 descending — no next greater for any: nums1=[3,2,1], nums2=[3,2,1] -> [-1,-1,-1]
    func testAllDescendingNoGreater() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([3, 2, 1], [3, 2, 1]), [-1, -1, -1])
    }

    // nums1 is last element of nums2: nums1=[2], nums2=[1,3,2] -> [-1]
    func testLastElementNoGreater() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([2], [1, 3, 2]), [-1])
    }

    // Next greater is not immediately adjacent: nums1=[1], nums2=[1,0,0,5] -> [5]
    func testNextGreaterNotAdjacent() {
        let sut = NextGreaterElementI()
        XCTAssertEqual(sut.nextGreaterElement([1], [1, 0, 0, 5]), [5])
    }
}
