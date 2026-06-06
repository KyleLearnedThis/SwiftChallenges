//
//  SubarraySumEqualsK.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/5/26.
//  https://leetcode.com/problems/subarray-sum-equals-k/

class SubarraySumEqualsK {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var runningSum = 0

        // key: prefix sum value, value: how many times we've seen it
        // seed with 0:1 so subarrays starting at index 0 are handled
        var seenPrefixSums = [0: 1]

        for num in nums {
            runningSum += num

            // what prefix sum do we need to have seen in the past
            // so that (runningSum - pastSum) == k?
            let neededPastSum = runningSum - k

            // each time that past prefix sum appeared is a valid subarray ending here
            count += seenPrefixSums[neededPastSum, default: 0]

            // record that we've now seen this prefix sum
            seenPrefixSums[runningSum, default: 0] += 1
        }

        return count
    }
}
