//
//  HeightBalancedTree.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class HeightBalancedTree {
    public func sortedArrayToBST(nums: Array<Int>) -> TreeNode<Int>? {
        if nums.count == 0 {
            return nil
        }
        return sortedArrayToBST(nums: nums, low: 0, high: nums.count - 1)
    }

    public func sortedArrayToBST(nums: Array<Int>, low: Int, high: Int) -> TreeNode<Int>? {
        if low > high {
            return nil
        }
        let mid = (high + low) / 2
        let cur = TreeNode<Int>(data: nums[mid])
        cur.left = sortedArrayToBST(nums: nums, low: low, high: mid - 1)
        cur.right = sortedArrayToBST(nums: nums, low: mid + 1, high: high)
        return cur
    }
}
