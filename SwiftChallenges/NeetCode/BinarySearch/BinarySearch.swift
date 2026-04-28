//
//  BinarySearch.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/27/26.
//  https://leetcode.com/problems/binary-search

class BinarySearch {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0 // index
        var high = nums.count - 1 // index
        repeat {
            let mid = (low + high) / 2 // middle index
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        } while low <= high
        return -1
    }
}
