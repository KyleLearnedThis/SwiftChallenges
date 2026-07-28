//
//  FindAllNumbersDisappearedInArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/25/26.
//  https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/

// 448. Find All Numbers Disappeared in an Array
//
// Given nums of n integers where every nums[i] is in the range [1, n],
// return every integer in [1, n] that does not appear. Values may repeat,
// so some numbers appear twice and others not at all.
//
// Example 1:
//   Input:  [4, 3, 2, 7, 8, 2, 3, 1]
//   Output: [5, 6]
//
// Example 2:
//   Input:  [1, 1]
//   Output: [2]
//
// Key insight: because the values are bounded by [1, n] and the array has
// exactly n slots, value and index are the same information wearing two
// hats -- value v belongs to slot v - 1. That mapping is what makes the
// Set unnecessary: there is no need to allocate somewhere to record "I saw
// a 5", because slot 4 already exists and is reserved for exactly that
// fact. The array is its own lookup table.
//
// What is left is finding one free bit per slot to store seen/unseen. The
// sign bit is that bit: every value is guaranteed positive on the way in,
// so negative can be repurposed to mean "marked" without destroying the
// payload -- abs() recovers the original number at any time. Two layers of
// meaning in one Int, which is why nothing extra has to be allocated.
//
// The pass order matters. Marking has to finish completely before reading,
// since a slot only means "missing" once every value has had its say. Two
// separate O(n) loops, not one fused loop.
//
// Time O(n) -- two linear passes, no sorting.
// Space O(1) auxiliary, excluding the returned list, in the sense the
// LeetCode follow-up means: no Set, nothing that grows with n. Swift adds
// one caveat -- see `var nums` below.
class FindAllNumbersDisappearedInArray {

    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        // Arrays are value types, so the parameter is a `let` and cannot be
        // mutated. Shadowing does not copy here; copy-on-write defers that
        // to the first write, where the buffer is found to be shared with
        // the caller and is duplicated. So the honest Swift cost is one
        // O(n) copy that C++/Java would not pay -- a language artifact, not
        // an algorithmic one. `inout` or a `consuming` parameter would
        // mutate in place for real, at the cost of the LeetCode signature.
        var nums = nums
        // Pass 1 -- mark. For each value seen, negate the slot that value
        // owns.
        for num in nums {
            // Value -> index. The -1 is the [1, n] to [0, n-1] shift: value
            // 5 is owned by slot 4.
            //
            // abs() protects against reading a slot that an earlier
            // iteration already flipped negative; without it, -7 - 1 = -8
            // indexes out of bounds. It happens to be redundant in this
            // exact formulation -- `for num in nums` iterates a snapshot
            // (IndexingIterator holds its own reference, which is also what
            // forces the CoW copy above), so `num` is always an original
            // positive value. Rewriting this as `for i in nums.indices`
            // would read the live array and make abs() load-bearing.
            let i = abs(num) - 1
            // -abs() rather than plain negation, because duplicates land on
            // the same slot twice: [3, 3] would hit slot 2 once to negate
            // and again to flip it back, silently un-marking a number that
            // was seen. -abs() is idempotent, negation is not.
            nums[i] = -abs(nums[i])
        }
        // Pass 2 -- read. A slot still positive was never claimed by any
        // value, so the number owning it never appeared.
        for (i,n) in nums.enumerated() {
            if n > 0 {
                // Index -> value, undoing the shift from pass 1.
                result.append(i + 1)
            }
        }
        return result
    }
}
