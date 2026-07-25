//
//  NonOverlappingIntervals.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/25/26.
//  https://leetcode.com/problems/non-overlapping-intervals/

// 435. Non-overlapping Intervals
//
// Given an array of intervals, return the minimum number that must be
// removed so the rest are non-overlapping. Touching endpoints ([1,2] and
// [2,3]) do NOT count as overlapping.
//
// Example 1:
//   Input:  [[1, 2], [2, 3], [3, 4], [1, 3]]
//   Output: 1   (drop [1,3] and the rest are disjoint)
//
// Example 2:
//   Input:  [[1, 2], [1, 2], [1, 2]]
//   Output: 2   (two duplicates must go)
//
// Key insight: flip the question. "Erase the fewest" is the same as "keep
// the most", which is classic activity selection -- a greedy problem, not a
// search. Sorting first means an overlap can only ever be with the interval
// currently held, so one pass suffices and nothing needs re-examining.
//
// When two do overlap, exactly one of them has to go, and the choice is
// forced: drop whichever ends LATER. A later end covers everything the
// earlier end covers and then some, so it can only block more future
// intervals, never fewer. Keeping the smaller end is never worse -- that is
// the exchange argument the greedy rests on.
//
// Sorting by start is why min() below is load-bearing: starts are ordered
// but ends arrive in any order, so the later-ending interval may be either
// the one held or the one just reached. Sorting by end instead would make
// the incoming end always the larger one, and the min() could collapse to
// simply leaving prevEnd alone. Same answer, different bookkeeping.
//
// Time O(n log n) -- dominated by the sort, the pass itself is O(n).
// Space O(n) for the sorted copy.
class NonOverlappingIntervals {

    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        // Zero or one interval can never overlap; also guards sorted[0] below.
        guard intervals.count > 1 else { return 0 }
        // Sort by start so overlaps are always with the interval just held,
        // never with one further back.
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var result = 0
        // The end of the interval currently being kept -- the boundary every
        // later interval is measured against.
        var prevEnd = sorted[0][1]
        for i in 1 ..< sorted.count {
            let start = sorted[i][0]
            let end = sorted[i][1]
            if start >= prevEnd {
                // No overlap. >= not > because touching endpoints are legal,
                // so [1,2] followed by [2,3] costs nothing. Keep this one and
                // advance the boundary.
                prevEnd = end
            } else {
                // Overlap: one of the two must be erased. Count it, then let
                // min() decide which survives by keeping the earlier end.
                // If end < prevEnd this interval is the tighter one and takes
                // over ([1,100] then [1,11] -> boundary drops to 11); if not,
                // prevEnd stays and this interval is the one discarded.
                result = result + 1
                prevEnd = min(end, prevEnd)
            }
        }
        return result
    }
}
