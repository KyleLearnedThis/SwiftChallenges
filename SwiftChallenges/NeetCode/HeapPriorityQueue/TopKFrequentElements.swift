//
//  TopKFrequentElements.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 8/1/26.
//  https://leetcode.com/problems/top-k-frequent-elements/

// 347. Top K Frequent Elements
//
// Given an integer array, return the k most frequent elements. The answer may
// be returned in any order.
//
// Example 1:
//   Input:  nums = [1, 1, 1, 2, 2, 3], k = 2
//   Output: [1, 2]
//
// Example 2:
//   Input:  nums = [1], k = 1
//   Output: [1]
//
// The counting pass is forced: frequency is a property of the whole array, so
// no element can be ranked before every element has been seen. Once the tally
// exists the original array is irrelevant -- the problem has become a selection
// over d distinct (value, count) pairs, and d is the size that matters from
// there on, not n.
//
// Sorting those pairs by descending count puts the answer in a prefix, which is
// what makes `entry[0..<k]` legal without further reasoning. It does buy more
// than the question asks for: a total order over all d values when only the top
// k matter, and even their order is explicitly irrelevant. A k-capped min-heap
// spends O(d log k) instead of O(d log d) by never ranking the losers against
// each other; bucketing counts into 1...n drops it to O(n) outright. Both are
// worth knowing here -- the sort is the version that reads in three lines.
//
// Time O(n + d log d) -- one pass to tally, then the sort dominates.
// Space O(d) for the tally, O(d) for the sorted pairs.
class TopKFrequentElements {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freq = [Int:Int]()
        for num in nums {
            freq[num] = freq[num, default: 0] + 1
        }
        let entry: [(Int,Int)] = freq.sorted{ $0.1 > $1.1 }
        let slice = entry[0..<k].map{$0.0}
        return slice
    }
}
