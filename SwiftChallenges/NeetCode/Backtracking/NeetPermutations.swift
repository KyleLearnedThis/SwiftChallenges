//
//  NeetPermutations.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/15/26.
//  https://leetcode.com/problems/permutations/

class NeetPermutations {

    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        // tracks which indices are already in the current permutation
        var used = [Bool](repeating: false, count: nums.count)

        func backtrack() {
            // current permutation is complete — record it
            if current.count == nums.count {
                result.append(current)
                return
            }
            // recursively pick one unused number at a time
            for i in 0..<nums.count {
                if used[i] { continue }
                used[i] = true
                current.append(nums[i])  // add it to the current path
                backtrack()              // recurse with the remaining numbers
                current.removeLast()     // remove it and try the next one — this is the backtrack
                used[i] = false
            }
        }

        backtrack()
        return result
    }
}
