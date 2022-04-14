//
//  TwoSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/12/22.
//  https://leetcode.com/problems/two-sum/

import Foundation

class TwoSum {
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        return [-1,-1]
    }
}
