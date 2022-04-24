//
//  PivotIndex.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/23/22.
//  https://leetcode.com/problems/find-pivot-index/

import Foundation

class PivotIndex {
    static func find(_ nums: [Int]) -> Int {
        for i in nums.indices {
            let left = Array(nums[0..<i]).reduce(0,+)
            let right = Array(nums[i+1..<nums.count]).reduce(0,+)
            if left == right {
                return i
            }
        }
        return -1
    }
}
