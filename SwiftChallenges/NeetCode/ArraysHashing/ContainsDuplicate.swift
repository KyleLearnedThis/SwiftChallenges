//
//  ContainsDuplicate.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/26/26.
//  https://leetcode.com/problems/contains-duplicate/

class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let set = Set(nums)
        if set.count == nums.count {
            return false
        } else {
            return true
        }
    }
}
