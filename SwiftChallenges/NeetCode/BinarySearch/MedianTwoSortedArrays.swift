//
//  MedianTwoSortedArrays.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 4/30/26.
//  https://leetcode.com/problems/median-of-two-sorted-arrays/

class MedianTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // Core idea: instead of merging, find a cut in each array so the combined
        // left half contains exactly the smaller half of all elements and every
        // element on the left is ≤ every element on the right.

        // Binary search on the shorter array so `j` is always in bounds.
        let (a, b) = nums1.count <= nums2.count ? (nums1, nums2) : (nums2, nums1)
        let m = a.count, n = b.count

        // Ceiling keeps the left partition one element larger on an odd total,
        // making the median the max of the left (no separate odd/even result path needed
        // for the partition check, only for the final return).
        let half = (m + n + 1) / 2

        // `lo`/`hi` represent how many elements `a` can contribute to the left partition.
        var lo = 0, hi = m

        while lo <= hi {
            let i = (lo + hi) / 2  // elements from `a` in the left partition
            let j = half - i       // elements from `b` in the left partition (determined by i)

            // The four values that sit directly beside the cut in each array.
            // Int.min/Int.max act as sentinels when the cut is flush against an edge.
            let aLeft  = i > 0 ? a[i - 1] : Int.min  // largest on the left from `a`
            let aRight = i < m ? a[i]     : Int.max  // smallest on the right from `a`
            let bLeft  = j > 0 ? b[j - 1] : Int.min  // largest on the left from `b`
            let bRight = j < n ? b[j]     : Int.max  // smallest on the right from `b`

            if aLeft <= bRight && bLeft <= aRight {
                // Valid cut: only two cross-checks are needed because each array is
                // already sorted — aLeft ≤ aRight and bLeft ≤ bRight are guaranteed.
                if (m + n) % 2 == 1 {
                    // Odd total: left partition has one extra element; it is the median.
                    return Double(max(aLeft, bLeft))
                } else {
                    // Even total: median is the average of the two middle elements —
                    // the largest on the left and the smallest on the right.
                    return Double(max(aLeft, bLeft) + min(aRight, bRight)) / 2.0
                }
            } else if aLeft > bRight {
                hi = i - 1  // `a`'s left edge is too large; move the cut left in `a`
            } else {
                lo = i + 1  // `b`'s left edge is too large; move the cut right in `a`
            }
        }

        return 0.0  // unreachable for valid sorted inputs
    }
}
