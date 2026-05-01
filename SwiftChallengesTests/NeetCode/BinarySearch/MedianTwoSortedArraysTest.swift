//
//  MedianTwoSortedArraysTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/30/26.
//

import XCTest

class MedianTwoSortedArraysTest: XCTestCase {
    var sut: MedianTwoSortedArrays!

    override func setUp() {
        super.setUp()
        sut = MedianTwoSortedArrays()
    }

    // LeetCode example 1: odd total length
    func test_oddTotalLength() {
        XCTAssertEqual(sut.findMedianSortedArrays([1, 3], [2]), 2.0)
    }

    // LeetCode example 2: even total length
    func test_evenTotalLength() {
        XCTAssertEqual(sut.findMedianSortedArrays([1, 2], [3, 4]), 2.5)
    }

    // nums1 is empty, odd length nums2
    func test_firstArrayEmpty_oddLength() {
        XCTAssertEqual(sut.findMedianSortedArrays([], [1]), 1.0)
    }

    // nums1 is empty, even length nums2
    func test_firstArrayEmpty_evenLength() {
        XCTAssertEqual(sut.findMedianSortedArrays([], [1, 2]), 1.5)
    }

    // nums2 is empty
    func test_secondArrayEmpty() {
        XCTAssertEqual(sut.findMedianSortedArrays([3, 5], []), 4.0)
    }

    // All of nums1 is smaller than nums2
    func test_allNums1SmallerThanNums2() {
        XCTAssertEqual(sut.findMedianSortedArrays([1, 2, 3], [4, 5, 6]), 3.5)
    }

    // All of nums2 is smaller than nums1
    func test_allNums2SmallerThanNums1() {
        XCTAssertEqual(sut.findMedianSortedArrays([4, 5, 6], [1, 2, 3]), 3.5)
    }

    // Fully interleaved arrays
    func test_interleaved() {
        XCTAssertEqual(sut.findMedianSortedArrays([1, 3, 5], [2, 4, 6]), 3.5)
    }

    // Single element each, even total
    func test_singleElementEach() {
        XCTAssertEqual(sut.findMedianSortedArrays([1], [2]), 1.5)
    }

    // Duplicate elements
    func test_duplicates() {
        XCTAssertEqual(sut.findMedianSortedArrays([1, 1], [1, 1]), 1.0)
    }

    // Negative numbers
    func test_negativeNumbers() {
        XCTAssertEqual(sut.findMedianSortedArrays([-3, -1], [-2, 0]), -1.5)
    }

    // Very unequal sizes
    func test_unequalSizes() {
        XCTAssertEqual(sut.findMedianSortedArrays([1], [2, 3, 4, 5, 6]), 3.5)
    }

    // Target sits between the two arrays
    func test_medianFromSecondArray() {
        XCTAssertEqual(sut.findMedianSortedArrays([2], [1, 3]), 2.0)
    }

    // All zeros
    func test_allZeros() {
        XCTAssertEqual(sut.findMedianSortedArrays([0, 0], [0, 0]), 0.0)
    }
}
