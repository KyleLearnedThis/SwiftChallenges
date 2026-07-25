//
//  MergeIntervals.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/21/26.
//

// 56. Merge Intervals
//
// Given an array of intervals where intervals[i] = [start_i, end_i],
// merge all overlapping intervals and return the non-overlapping intervals
// that cover all the input intervals.
//
// Example 1:
//   Input:  [[1, 3], [2, 6], [8, 10], [15, 18]]
//   Output: [[1, 6], [8, 10], [15, 18]]   ([1,3] and [2,6] overlap -> [1,6])
//
// Example 2:
//   Input:  [[1, 4], [4, 5]]
//   Output: [[1, 5]]
//
// Note: unlike MeetingRooms, intervals that only touch at an endpoint
// (e.g. [1,4] and [4,5]) DO count as overlapping and get merged.
//
// Key insight: after sorting by start, any interval can only overlap the one
// most recently placed in the output. Nothing earlier can reach it, because
// every earlier interval has a start <= this one's and was already merged into
// that last slot. So a single backward glance is enough -- no nested scan.
//
// Time O(n log n) -- the sort dominates; the merge pass is a single O(n) sweep.
// Space O(n) for the output (O(log n) extra for the sort itself).
class MergeIntervals {

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // Guard the empty case: sorted[0] below would trap on an empty array.
        guard !intervals.isEmpty else { return [] }
        // sort by start value
        let sorted = intervals.sorted(by: { $0[0] < $1[0] })
        // Seed with the first interval so there is always a "last placed" one.
        var output = [sorted[0]]

        for interval in sorted[1...] {
            let start = interval[0]
            let end = interval[1]
            let lastEnd = output[output.count - 1][1]
            // Compare this start against the PREVIOUS end, not its own end.
            if start <= lastEnd {
                // max() matters when fully contained -- [1,10] then [2,3] keeps 10.
                output[output.count - 1][1] = max(lastEnd, end)
            } else {
                // Non overlapping
                output.append([start, end])
            }
        }
        return output
    }
}
