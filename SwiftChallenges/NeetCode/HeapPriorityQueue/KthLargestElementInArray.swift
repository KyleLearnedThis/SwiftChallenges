//
//  KthLargestElementInArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 9/26/26.
//  https://leetcode.com/problems/kth-largest-element-in-an-array/

// 215. Kth Largest Element in an Array
//
// Given an integer array and an integer k, return the kth largest element in
// sorted order -- not the kth distinct element.
//
// Example 1:
//   Input:  nums = [3, 2, 1, 5, 6, 4], k = 2
//   Output: 5
//
// Example 2:
//   Input:  nums = [3, 2, 3, 1, 2, 4, 5, 5, 6], k = 4
//   Output: 4
//
// Sorting descending puts the kth largest at index k - 1 by definition, so the
// whole problem reduces to that one index shift. O(n log n) to answer a question
// about a single position is more work than necessary -- a size-k min-heap gets
// O(n log k), and quickselect averages O(n) by partitioning toward the target
// index and discarding the side that cannot contain it -- but the sort is the
// version with no invariant to get wrong.
//
// The trap is "kth largest" reading as "kth distinct largest". Duplicates
// occupy their own positions: [5, 5, 5, 2, 1] with k = 3 answers 5, because the
// three 5s fill ranks one through three. Deduplicating through a Set first
// would collapse them to [5, 2, 1] and answer 2. Example 2 makes the same
// point -- the duplicate 5s and 3s are what push 4 into rank four.
//
// Time O(n log n) -- the sort dominates.
// Space O(n) for the sorted copy.
class KthLargestElementInArray {

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sorted = nums.sorted {$0 > $1}
        let result = sorted[k-1]
        return result
    }
}
