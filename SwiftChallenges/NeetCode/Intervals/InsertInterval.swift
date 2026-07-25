//
//  InsertInterval.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/24/26.
//  https://leetcode.com/problems/insert-interval/

// 57. Insert Interval
//
// Given a sorted array of non-overlapping intervals and one newInterval,
// insert it and return the array still sorted and non-overlapping, merging
// wherever the new one touches existing ones.
//
// Example 1:
//   Input:  [[1, 3], [6, 9]], newInterval = [2, 5]
//   Output: [[1, 5], [6, 9]]   ([1,3] and [2,5] overlap -> [1,5])
//
// Example 2:
//   Input:  [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], newInterval = [4, 8]
//   Output: [[1, 2], [3, 10], [12, 16]]
//
// Key insight: unlike MergeIntervals, the input is ALREADY sorted and
// non-overlapping, so no sort is needed -- one forward pass is enough. Each
// existing interval is in exactly one of three relationships with newInterval,
// and because the input is sorted they arrive in this order: all the "before"
// ones, then the overlapping run, then all the "after" ones.
//
// The overlapping run is contiguous, which is what makes the single pass work:
// once an interval overlaps, newInterval only ever grows, so it keeps
// overlapping until the run ends -- there is no need to look back.
//
// Time O(n) -- one pass, and the tail is a bulk copy.
// Space O(n) for the output.
class InsertInterval {

    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // Shadow the parameter so it can be widened as overlaps are absorbed.
        var newInterval = newInterval
        var result: [[Int]] = []

        for i in 0 ..< intervals.count {
            if newInterval[1] < intervals[i][0] {
                // Case 1: this interval starts after newInterval ends, so the
                // merging is finished. Place newInterval, then bulk-copy the
                // untouched tail and bail out -- nothing left can overlap.
                result.append(newInterval)
                result.append(contentsOf: intervals[i...])
                return result
            } else if newInterval[0] > intervals[i][1] {
                // Case 2: this interval ends before newInterval starts, so it
                // is entirely to the left. Copy it through unchanged.
                result.append(intervals[i])
            } else {
                // Case 3: overlap. Absorb it into newInterval instead of
                // appending -- they collapse into one. min() matters when this
                // interval starts earlier ([1,3] vs new [3,5]); max() when
                // newInterval is fully contained ([1,10] vs new [3,4]).
                newInterval[0] = min(intervals[i][0], newInterval[0])
                newInterval[1] = max(intervals[i][1], newInterval[1])
            }
        }
        // Reached only when Case 1 never fired, i.e. newInterval belongs last.
        // Also covers empty input, where the loop never runs at all.
        result.append(newInterval)
        return result
    }
}
