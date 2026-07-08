//
//  LongestIncreasingSubsequence.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/7/26.
//  https://leetcode.com/problems/longest-increasing-subsequence/

// TIME:  O(n^2)
// SPACE: O(n)

class LongestIncreasingSubsequence {

    func lengthOfLIS(_ nums: [Int]) -> Int {
        // Initialize every index to 1 because it's a subsequence of just itself
        var cache = Array<Int>(repeating: 1, count: nums.count)
        // Travel from the last index and build up cache
        for i in (0..<nums.count).reversed() {
            for j in i+1..<nums.count {
                // if nums[i] -> nums[j] is increasing order
                if nums[j] > nums[i] {
                    cache[i] = max(cache[i], 1 + cache[j])
                }
            }
        }
        return cache.max() ?? 0
    }
}
