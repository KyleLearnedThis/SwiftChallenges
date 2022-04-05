//
//  MedianOfTwoSortedArrays.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/median-of-two-sorted-arrays

import Foundation

class MedianOfTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        var A = Array(repeating: 0, count: m + n)

        var i = m - 1
        var j = n - 1
        var k = m + n - 1

        while k >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                A[k] = nums1[i];
                k = k - 1
                i = i - 1
            } else {
                A[k] = nums2[j];
                k = k - 1
                j = j - 1
            }
        }
        let o = A.count / 2
        var medium: Double
        if A.count % 2 == 0 {
            medium = Double((A[o-1] + A[o]))/2
        } else {
            medium = Double(A[o])
        }
        return medium
    }
}
