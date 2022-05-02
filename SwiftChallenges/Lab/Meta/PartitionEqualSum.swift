//
//  PartitionEqualSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/1/22.
//  https://leetcode.com/problems/partition-equal-subset-sum/

import Foundation

class PartitionEqualSum {

    /** https://leetcode.com/problems/partition-equal-subset-sum/discuss/90627/Java-Solution-similar-to-backpack-problem-Easy-to-understand
     **/
    static func canPartition(_ nums: [Int]) -> Bool {
        // Edge case
        if nums.isEmpty {
            return true
        }

        // Prepration
        var volume = nums.reduce(0, +)
        if volume % 2 == 1 {
            return false
        }
        volume /= 2
        var dp = [Bool](repeating: false, count: volume+1)
        dp[0] = true

        for i in 1...nums.count {
            var j = volume
            while j >= nums[i-1] {
                dp[j] = dp[j] || dp[j - nums[i-1]]
                j -= 1
            }
        }
        return dp[volume]
    }

    /** https://leetcode.com/problems/partition-equal-subset-sum/discuss/90639/Java-Solution-similar-to-'Subset-Sum-Problem'
        TODO: It won't pass on some test cases.
     **/
    static func canPartitionV2(_ nums: [Int]) -> Bool {
        if nums.isEmpty {
            return true
        }

        let sum = nums.reduce(0, +)
        if sum % 2 == 1 {
            return false
        }

        let target = sum/2
        var dp = [[Bool]](repeating: [], count: nums.count)
        for i in 0..<nums.count {
            for _ in 0..<target+1 {
                dp[i].append(false)
            }
        }

        if nums[0] <= target{
            dp[0][nums[0]] = true
        }

        for i in 0..<nums.count {
            dp[i][0] = true
        }

        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
                if j < nums[i] {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - nums[i]]
                }
            }
        }

        return dp[dp.count - 1][dp[0].count - 1]
    }
}

