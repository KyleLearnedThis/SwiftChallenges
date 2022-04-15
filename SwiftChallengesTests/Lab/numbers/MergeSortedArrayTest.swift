//
//  MergeSortedArrayTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class MergeSortedArrayTest: XCTestCase {
    func testV1_01() {
        var nums1 = [1,2,3,0,0,0]
        let nums2 = [2,5,6]
        let m = 3
        let n = 3
        MergeSortedArray.mergeV1(&nums1, m, nums2, n)
        for i in nums1 {
            print("[\(i)] ", terminator: " ")
        }
        print("")
    }

    func testV2_01() {
        let nums1 = [1,2,3]
        let nums2 = [2,5,6]
        let actual = MergeSortedArray.mergeV2(nums1, nums2)
        let expected = [1,2,2,3,5,6]
        XCTAssertEqual(expected, actual)
    }
}
