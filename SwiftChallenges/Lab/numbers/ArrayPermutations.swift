//
//  ArrayPermutations.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/25/22.
//  https://leetcode.com/problems/permutations/

import Foundation


class ArrayPermutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var item:[Int] = []
        var res:[[Int]] = []
        helper(nums, item: &item, res: &res)
        return res
    }

    private func helper(_ nums: [Int], item: inout [Int], res: inout [[Int]]){
        if item.count == nums.count {
            res.append(item)
            return
        }
        for i in 0..<nums.count{
            if item.contains(nums[i]) { continue }
            item.append(nums[i])
            helper(nums, item: &item, res: &res)
            item.removeLast()
        }
    }
}
