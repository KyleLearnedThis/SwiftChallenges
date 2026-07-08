//
//  HouseRobber.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/5/26.
//  https://leetcode.com/problems/house-robber/

class HouseRobber {

    // BOTTOM-UP DP — O(n) time, O(1) space
    // Builds the answer forward: solves house 0, then 1, then 2...
    // Only needs the last two results, so no array required.
    func rob(_ nums: [Int]) -> Int {
        // prevPrev = best loot achievable before the previous house (0 initially)
        // prev     = best loot achievable up to the previous house (0 initially)
        var prevPrev = 0
        var prev = 0
        for n in nums {
            // rob this house: prevPrev + n (skip previous to avoid triggering alarm)
            // skip this house: prev carries forward unchanged
            let best = max(prevPrev + n, prev)
            prevPrev = prev  // slide window forward
            prev = best
        }
        return prev
    }

    // TOP-DOWN DP (memoized recursion) — O(n) time, O(n) space
    // Starts from house 0 and branches into two choices at each step.
    // memo caches results so each house is only computed once.
    func robV2(_ nums: [Int]) -> Int {
        var memo = [Int: Int]()

        func dfs(_ i: Int) -> Int {
            if i >= nums.count { return 0 }        // past the last house
            if let cached = memo[i] { return cached }

            // choice 1: rob house i, then skip i+1 and recurse from i+2
            // choice 2: skip house i, recurse from i+1
            let result = max(nums[i] + dfs(i + 2), dfs(i + 1))
            memo[i] = result
            return result
        }

        return dfs(0)
    }
}
