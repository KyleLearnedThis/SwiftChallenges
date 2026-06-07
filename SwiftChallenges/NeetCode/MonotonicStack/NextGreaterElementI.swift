//
//  NextGreaterElementI.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/26.
//  https://leetcode.com/problems/next-greater-element-i/

class NextGreaterElementI {

    // Strategy: monotonic decreasing stack
    //
    // Walk through nums2. Keep a stack of numbers that haven't found
    // their next greater element yet (always decreasing top→bottom).
    //
    // When we see a number larger than the stack's top, that number IS
    // the next greater element for everything smaller on the stack —
    // pop and record each one until the stack is no longer smaller.
    //
    // After the full pass, anything left in the stack has no next greater.
    // Then answer each nums1 query with a single map lookup.
    //
    // Time: O(n)  Space: O(n)

    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        // Maps each number → its next greater element in nums2
        var nextGreaterMap: [Int: Int] = [:]

        // Monotonic decreasing stack (stores unresolved numbers)
        var stack: [Int] = []

        for current in nums2 {

            // current is larger than the top → it's the next greater for those elements
            while let top = stack.last, top < current {
                stack.removeLast()
                nextGreaterMap[top] = current
            }

            // Push current; its next greater hasn't been seen yet
            stack.append(current)
        }

        // Anything still in the stack has no next greater element (implicitly -1)

        return nums1.map { nextGreaterMap[$0, default: -1] }
    }
}
