//
//  MinimumRotatedSortedArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/30/26.
//  https://leetcode.com/problems/find-minimum-in-rotated-sorted-array

class MinimumRotatedSortedArray {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            // mid is in the left sorted half; minimum must be to the right
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                // mid is in the right sorted half; minimum is at mid or to the left
                right = mid
            }
        }
        return nums[left]
    }
}
