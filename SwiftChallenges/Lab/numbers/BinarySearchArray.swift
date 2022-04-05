//
//  BinarySearch.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/binary-search/

import Foundation

class BinarySearchArray {
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var pivot = 0
        var left = 0
        var right = nums.count - 1
        while left <= right {
            pivot = left + (right - left) / 2
            if nums[pivot] == target {
                return pivot
            }
            if target < nums[pivot] {
                right = pivot - 1
            } else {
                left = pivot + 1
            }
        }
        return -1
    }
}
