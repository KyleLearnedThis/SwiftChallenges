//
//  MedianOfTwoSortedArraysTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class MedianOfTwoSortedArraysTest: XCTestCase {

    func testBasic01() {
        let nums1 = [1,3]
        let nums2 = [2]
        let mtsa = MedianOfTwoSortedArrays()
        let actual = mtsa.findMedianSortedArrays(nums1, nums2)
        let expected = 2.0
        XCTAssertEqual(actual, expected)
    }

    func testBasic02() {
        let nums1 = [1,2]
        let nums2 = [3,4]
        let mtsa = MedianOfTwoSortedArrays()
        let actual = mtsa.findMedianSortedArrays(nums1, nums2)
        let expected = 2.5
        XCTAssertEqual(actual, expected)
    }
}
