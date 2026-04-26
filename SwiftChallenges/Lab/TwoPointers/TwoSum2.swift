//
//  TwoSum2.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/25/26.
//  https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

class TwoSum2 {
    // LeetCode Problem is 1-indexed
    func twoSum(_ numbers: [Int], _ target: Int, _ isZeroIndexed: Bool = false) -> [Int] {
        var l = 0
        var r = numbers.count - 1
        while l < r {
            let leftVal = numbers[l]
            let rightVal = numbers[r]
            if leftVal + rightVal == target {
                if isZeroIndexed {
                    return [l, r]
                } else {
                    return [l + 1, r + 1]
                }
            } else if leftVal + rightVal > target {
                r = r - 1
            } else {
                l = l + 1
            }
        }
        return [0,0]
    }
}
