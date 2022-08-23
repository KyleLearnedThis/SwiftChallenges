//
//  MinimizeMaxPairSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/23/22.
//  https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/

import Foundation

class MinimizeMaxPairSum {
    static func minPairSum(_ nums: [Int]) -> Int {
        var answer = [Int]()
        let sortedArray = nums.sorted()
        for i in 0 ... (nums.count / 2) {
            let l = sortedArray[i]
            let r = sortedArray[sortedArray.count-i-1]
            answer.append(l+r)
        }
        let max = answer.max()!
        return max
    }
}
