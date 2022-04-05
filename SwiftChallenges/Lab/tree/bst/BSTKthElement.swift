//
//  BSTKthElement.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/4/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/kth-smallest-element-in-a-bst/

class BSTKthElement {
    var result = [Int]()
    func kthSmallest(_ root: TreeNode<Int>?, _ k: Int) -> Int {
        inOrderWork(node: root) // k is 1 based index

        if !result.isEmpty && result.count >= k && k >= 1{
            return result[k - 1]
        }
        return -1
    }

    func inOrderWork(node: TreeNode<Int>?) {
        if let left = node?.left {
            inOrderWork(node: left)
        }

        let data = node?.data
        result.append(data!)

        if let right = node?.right {
            inOrderWork(node: right)
        }
    }
}
