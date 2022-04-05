//
//  MergeSortedArrayTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class MergeSortedArrayTest: XCTestCase {
    func testV1() {
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
}
