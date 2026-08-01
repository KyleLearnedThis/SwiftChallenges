//
//  FirstMissingPositive.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/27/26.
//  https://leetcode.com/problems/first-missing-positive/

// 41. First Missing Positive
//
// Given an unsorted array of arbitrary integers, return the smallest positive
// integer absent from it, in O(n) time and O(1) auxiliary space.
//
// Example 1:
//   Input:  [1, 2, 0]
//   Output: 3
//
// Example 2:
//   Input:  [3, 4, -1, 1]
//   Output: 2
//
// Pigeonhole sets the whole strategy. The candidates 1...n+1 are n+1 distinct
// values competing for n slots, so at least one must be absent: the answer can
// never exceed n + 1. That makes n + 1 a free fallback needing no storage, and
// leaves 1...n as the complete search space -- exactly the range for which
// slot v - 1 exists. Every value outside it is both unstorable and incapable
// of being the answer, so it can be ignored outright. An unbounded input
// collapses into n booleans, which is what buys O(1) space.
//
// Sign-marking supplies those booleans: negative at slot v - 1 means "v was
// seen", abs() recovers the payload. Same machinery as 442 and 448.
//
// What differs is that 442/448 guarantee 1 <= nums[i] <= n. Here nums[i] is
// any Int, and abs() cannot tell a mark it laid down from a minus sign that
// arrived in the input -- [-1, -2, -3] would report 1, 2, 3 as present and
// answer 4 instead of 1. Hence the sanitize pass: the sign bit is only a
// usable flag once nothing in the array is already negative.
//
// Time O(n) -- three linear passes.
// Space O(1) auxiliary; see `var nums` on Swift's copy-on-write caveat.
class FirstMissingPositive {

    func firstMissingPositive(_ nums: [Int]) -> Int {
        // Value type, so the parameter is a `let`. Shadowing is free until
        // the first write, where copy-on-write finds the buffer shared with
        // the caller and duplicates it -- one O(n) copy C++/Java would not
        // pay. A language artifact, not an algorithmic one.
        var nums = nums
        // Claim the sign bit. Negatives are the only values that could be
        // misread as marks, and they are all out of range anyway, so zeroing
        // them destroys nothing the answer depends on. Zero is the natural
        // placeholder: it already fails the range check below.
        //
        // This also makes abs() total -- abs(Int.min) traps, and Int.min is
        // reachable from the stated constraints.
        for i in 0..<nums.count where nums[i] < 0 {
            nums[i] = 0
        }
        // Indexing rather than `for num in nums`, because this pass has to
        // see the marks it is laying down; a snapshot iterator would hide
        // them and abs() would have nothing to undo.
        for i in 0 ..< nums.count {
            let val = abs(nums[i])
            // The pigeonhole filter, doing double duty: it drops values that
            // cannot be the answer, and it guarantees val - 1 is a legal
            // index. Written against val rather than val + 1 so Int.max
            // cannot overflow the comparison.
            if 1 <= val && val <= nums.count {
                // Value -> index. The -1 is the [1, n] to [0, n-1] shift.
                let index = val - 1
                if nums[index] > 0 {
                    // First sighting of `val`. Flip the slot.
                    nums[index] = -nums[index]
                } else if nums[index] == 0 {
                    // Slot holds a zeroed-out negative, or a genuine 0 from
                    // the input. Negation is a no-op on 0, so the flag would
                    // be silently lost -- substitute a value carrying the
                    // sign explicitly.
                    //
                    // The magnitude is arbitrary so long as it exceeds n:
                    // it must fail the range check when a later iteration
                    // reads this slot, or it would mark a value never seen.
                    // n + 1 is simply the smallest number that qualifies.
                    nums[index] = -(nums.count + 1)
                }
                // Remaining case -- slot already negative -- needs no write.
                // Presence is idempotent, so duplicates cost nothing, and
                // re-negating would un-mark it.
            }
        }
        // 1-based to read as "is i present?", answering candidates in
        // ascending order. That order is the entire source of *smallest*:
        // every candidate passed over was confirmed present, so the first
        // failure has nothing smaller beneath it.
        for i in 1 ..< nums.count + 1 {
            if nums[i - 1] >= 0 {
                return i
            }
        }
        // Nothing unmarked, so 1...n are all present and the pigeonhole
        // bound is tight -- the one input shape where the ceiling is reached.
        return nums.count + 1
    }
}
