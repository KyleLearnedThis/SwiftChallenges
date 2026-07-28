//
//  FindAllDuplicatesInArray.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/27/26.
//  https://leetcode.com/problems/find-all-duplicates-in-an-array/
//

// 442. Find All Duplicates in an Array
//
// Given nums of n integers where every nums[i] is in the range [1, n] and
// each integer appears at most twice, return every integer that appears
// exactly twice. Any order is accepted.
//
// Example 1:
//   Input:  [4, 3, 2, 7, 8, 2, 3, 1]
//   Output: [2, 3]
//
// Example 2:
//   Input:  [1, 1, 2]
//   Output: [1]
//
// Same machinery as 448: values bounded by [1, n] over exactly n slots, so
// value v owns slot v - 1 and the array doubles as its own lookup table.
// The sign bit is the free seen/unseen flag, and abs() recovers the payload.
//
// What differs is the read. 448 asks a question about the finished state of
// the marking -- "which slots were never claimed?" -- so no slot can be
// judged until every value has had its say, forcing two separate passes.
// 442 asks a question that answers itself mid-flight: arriving at a slot
// that is already marked *is* the second sighting, and since each value
// appears at most twice, that moment happens exactly once per duplicate.
// The finding rides along inside the marking pass. One loop, not two.
//
// Time O(n) -- single linear pass, no sorting.
// Space O(1) auxiliary, excluding the returned list, in the sense the
// LeetCode follow-up means: no Set, nothing that grows with n. Swift adds
// one caveat -- see `var nums` below.
class FindAllDuplicatesInArray {

    func findDuplicates(_ nums: [Int]) -> [Int] {
        // Arrays are value types, so the parameter is a `let` and cannot be
        // mutated. Shadowing does not copy here; copy-on-write defers that
        // to the first write, where the buffer is found to be shared with
        // the caller and is duplicated. So the honest Swift cost is one
        // O(n) copy that C++/Java would not pay -- a language artifact, not
        // an algorithmic one.
        var nums = nums
        var result = [Int]()
        // Indexing rather than `for num in nums`, because marking and
        // reading are fused: this loop has to see the marks it is laying
        // down, which a snapshot iterator would hide.
        for i in 0..<nums.count {
            // ...which is exactly why abs() is load-bearing here, unlike in
            // 448 where the snapshot made it redundant. Slot i may already
            // have been flipped negative by an earlier iteration, and
            // -2 - 1 = -3 indexes out of bounds.
            let num = abs(nums[i])
            // Value -> index. The -1 is the [1, n] to [0, n-1] shift: value
            // 5 is owned by slot 4.
            let index = num - 1
            if nums[index] < 0 {
                // Slot already claimed, so some earlier position held this
                // same value. Second sighting -- report it. Note `num`, not
                // the slot: the slot holds a marked *different* number.
                result.append(num)
            } else {
                // First sighting. Claim the slot.
                //
                // Plain negation is safe here only because the branch above
                // catches the already-negative case, so this always flips a
                // positive. 448 needed -abs() instead: its unguarded write
                // could hit the same slot twice and silently un-mark it.
                nums[index] = -nums[index]
            }
        }
        return result
    }
}
