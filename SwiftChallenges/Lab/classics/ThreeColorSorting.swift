//
//  ThreeColorSorting.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/4/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://en.wikipedia.org/wiki/Dutch_national_flag_problem
//  https://www.geeksforgeeks.org/sort-an-array-of-0s-1s-and-2s/
//  https://leetcode.com/problems/sort-colors/

import Foundation

class ThreeColorSorting {

    static func sortColors(_ nums: inout [Int]) {
        var low = 0
        var high = nums.count - 1
        var mid = 0

        while mid <= high {
            if nums[mid] == 0 {
                swap(&nums, low, mid)
                low += 1
                mid += 1
            } else if nums[mid] == 2 {
                swap(&nums, mid, high)
                high -= 1
            } else if nums[mid] == 1 {
                mid += 1
            }
        }
    }

    static func swap(_ array: inout [Int], _ l: Int, _ r: Int) {
        let temp = array[l]
        array[l] = array[r]
        array[r] = temp
    }
}
