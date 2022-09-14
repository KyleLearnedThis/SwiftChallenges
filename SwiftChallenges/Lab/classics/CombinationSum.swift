//
//  CombinationSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/14/22.
//  https://leetcode.com/problems/combination-sum

import Foundation

class CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combination: [Int] = [], results: [[Int]] = []
        dfs(&results, &combination, candidates.sorted(), target, 0)
        return results
    }

    private func dfs(_ results: inout [[Int]], _ combinations: inout [Int], _ candidates: [Int], _ t: Int, _ index: Int) {
        guard t > 0 else { results.append(combinations); return }
        for i in index ..< candidates.count where candidates[i] <= t {
            combinations.append(candidates[i])
            dfs(&results, &combinations, candidates, t - candidates[i], i)
            combinations.removeLast()
        }
    }
}
