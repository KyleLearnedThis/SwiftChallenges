//
//  MaximumDepthBinaryTree.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/8/26.
//  https://leetcode.com/problems/maximum-depth-of-binary-tree/

class MaximumDepthBinaryTree {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        let leftDepth = maxDepth(node.left)
        let rightDepth = maxDepth(node.right)
        return max(leftDepth, rightDepth) + 1
    }
}
