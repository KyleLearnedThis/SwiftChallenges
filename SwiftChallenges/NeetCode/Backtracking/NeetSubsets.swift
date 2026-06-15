//
//  NeetSubsets.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/14/26.
//  https://leetcode.com/problems/subsets/

class NeetSubsets {
    // Strategy: at each index, make a binary choice — include or exclude the element.
    // Recurse through every index to build all 2^n subsets.
    // Time: O(n * 2^n) — 2^n subsets, each up to length n to copy into result
    // Space: O(n) — recursion stack depth and subset buffer (output excluded)
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var subset = [Int]()  // current subset being built up (shared, mutated in place)

        // i = the current index we're deciding to include or exclude
        func backtrack(_ i: Int) {
            // Base case: we've made a decision for every element.
            // Whatever is in `subset` right now is a complete subset — record it.
            if i >= nums.count {
                result.append(subset)
                return
            }

            // --- Branch 1: INCLUDE nums[i] ---
            subset.append(nums[i])
            backtrack(i + 1)  // recurse with nums[i] in the subset

            // --- Branch 2: EXCLUDE nums[i] ---
            // Undo the include so `subset` is back to what it was before Branch 1.
            subset.removeLast()
            backtrack(i + 1)  // recurse WITHOUT nums[i] in the subset
        }

        backtrack(0)
        return result
    }
}
