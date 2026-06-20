//
//  NeetCombinationSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/15/26.
//  https://leetcode.com/problems/combination-sum/

class NeetCombinationSum {

    // O(2^(t/m)) time — t = target, m = min candidate. O(t/m) space for recursion depth.
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        // At each index: include it (stay at i to allow reuse) or skip to i+1.
        func dfs(i: Int, current: [Int], total: Int) {
            var current = current
            if total == target {
                result.append(current)
                return
            }
            if i >= candidates.count || total > target {
                return
            }
            // Include: i stays the same so the same candidate can be reused
            current.append(candidates[i])
            dfs(i: i, current: current, total: total + candidates[i])
            // Skip: advance to next candidate
            current.removeLast()
            dfs(i: i + 1, current: current, total: total)
        }
        dfs(i: 0, current: [], total: 0)
        return result
    }
}
