//
//  ContinuousSubarraySum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/2/26.
//  https://leetcode.com/problems/continuous-subarray-sum/

class ContinuousSubarraySum {
    // Returns true if any subarray of length >= 2 sums to a multiple of k.
    // Approach: if two prefix sums share the same remainder mod k, the subarray
    // between them is divisible by k (their difference cancels the remainder).
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        // Maps remainder -> earliest index it was seen.
        // Seeded with 0: -1 so a prefix sum divisible by k from index 0 is handled.
        var remainder = [0: -1]
        var total = 0

        for (i, n) in nums.enumerated() {
            total += n
            let r = total % k

            if remainder[r] == nil {
                // First time seeing this remainder — record the index.
                remainder[r] = i
            } else if i - remainder[r]! > 1 {
                // Same remainder seen before, and the subarray between is length >= 2.
                return true
            }
            // If the gap is <= 1 we skip — subarray must have at least 2 elements.
        }
        return false
    }
}
