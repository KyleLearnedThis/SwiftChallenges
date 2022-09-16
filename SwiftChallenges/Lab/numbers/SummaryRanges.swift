//
//  SummaryRanges.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/15/22.
//  https://leetcode.com/problems/summary-ranges/

import Foundation

class SummaryRanges {
    static func range(_ nums: [Int]) -> [String] {
        var result = [String]()
        if nums.isEmpty {
            return result
        }
        var first = nums[0]
        var last = first
        for i in 1..<nums.count{
            let cur = nums[i]
            if cur - last > 1 {
                let str = (last == first) ? "\(first)" : "\(first)->\(last)"
                result.append(str)
                first = cur
            }
            last = cur
        }
        let str = (last == first) ? "\(first)" : "\(first)->\(last)"
        result.append(str)
        return result
    }
}
