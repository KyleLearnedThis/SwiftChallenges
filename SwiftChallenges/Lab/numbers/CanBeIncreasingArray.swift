//
//  CanBeIncreasingArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/3/22.
//  https://leetcode.com/problems/remove-one-element-to-make-the-array-strictly-increasing/
//

import Foundation

class CanBeIncreasingArray {
    func canBeIncreasing(_ nums: [Int]) -> Bool {
        for i in 0..<(nums.count - 1) where nums[i + 1] <= nums[i] {
            let candidate1 = Array((i > 0 ? nums[...(i - 1)] : []) + nums[(i + 1)...])
            let candidate2 = Array(nums[...i] + ( (i < nums.count - 1) ? nums[(i + 2)...] : []))
            if !(isIncreasing(candidate1) || isIncreasing(candidate2)) {
                return false
            }
        }
        return true
    }

    private func isIncreasing(_ nums: [Int]) -> Bool {
        for i in 0..<(nums.count - 1) where nums[i + 1] <= nums[i] {
            return false
        }
        return true
    }
}
