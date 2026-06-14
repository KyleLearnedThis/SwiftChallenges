//
//  InvertBinaryTree.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/8/26.
//  https://leetcode.com/problems/invert-binary-tree/

class InvertBinaryTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        return root
    }
}
