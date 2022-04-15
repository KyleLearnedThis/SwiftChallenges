//
//  MergeSortedArray.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class MergeSortedArray {
    // https://leetcode.com/problems/merge-sorted-array/
    static func mergeV1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index = m + n - 1
        var i = m - 1
        var j = n - 1

        while (i >= 0 && j >= 0) {
            if nums1[i] > nums2[j] {
                nums1[index] = nums1[i]
                index = index - 1
                i = i - 1
            } else {
                nums1[index] = nums2[j]
                index = index - 1
                j = j - 1
            }
        }

        while j >= 0 {
            nums1[index] = nums2[j]
            index = index - 1
            j = j - 1
        }
    }

    static func mergeV2(_ a: [Int], _ b: [Int]) -> [Int] {
        var result = [Int](repeating: -1, count: a.count + b.count)
        var i = 0 // current index on a
        var j = 0 // current index on b
        var k = 0 // current index on result

        while i < a.count && j < b.count {
            if a[i] < b[j] {
                result[k] = a[i]
                i+=1
            } else {
                result[k] = b[j]
                j+=1
            }
            k+=1
        }

        while i < a.count {
            result[k] = a[i]
            k+=1
            i+=1
        }

        while j < b.count {
            result[k] = b[j]
            k+=1
            j+=1
        }

        return result
    }
}
