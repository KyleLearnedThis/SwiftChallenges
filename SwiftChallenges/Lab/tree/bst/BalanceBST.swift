//
//  BalanceBST.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/4/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/balance-a-binary-search-tree/

import Foundation

class BalanceBST {
    var list = [Int]()
    func balanceBST(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
        if root == nil {
            return nil
        }
        if root?.left == nil && root?.right == nil {
            return root
        }
        getAllNodes(root)
        list = list.sorted()
        let tree = HeightBalancedTree()
        let result = tree.sortedArrayToBST(nums: list, low: 0, high: list.count - 1)
        return result
    }

    private func getAllNodes(_ root: TreeNode<Int>?) {
        if root == nil {
            return
        }
        getAllNodes(root?.left)
        list.append(root!.data)
        getAllNodes(root?.right)
    }
}
