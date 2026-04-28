//
//  SearchRotatedSortedArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/27/26.
//  https://leetcode.com/problems/search-in-rotated-sorted-array/

class SearchRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0, hi = nums.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target { return mid }

            // One side is always fully sorted after a rotation.
            // Identify which side, then check if target falls within it.
            if nums[lo] <= nums[mid] {
                // Left half [lo...mid] is sorted
                if nums[lo] <= target && target < nums[mid] {
                    hi = mid - 1  // target is inside the sorted left half
                } else {
                    lo = mid + 1  // target must be in the right half
                }
            } else {
                // Right half [mid...hi] is sorted
                if nums[mid] < target && target <= nums[hi] {
                    lo = mid + 1  // target is inside the sorted right half
                } else {
                    hi = mid - 1  // target must be in the left half
                }
            }
        }
        return -1
    }
}
