//
//  BinaryTreeSymmetric.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/22.
//  https://leetcode.com/problems/symmetric-tree/

import Foundation

class BinaryTreeSymmetric {
    func isSymmetric(_ root: TreeNode<Int>?) -> Bool {
        if root == nil {
            return true
        }

        return isSymmetricWork(left: root?.left, right: root?.right)
    }

    private func isSymmetricWork(left: TreeNode<Int>?, right: TreeNode<Int>?) -> Bool {
        if left == nil || right == nil {
            return left === right
        }
        if left?.data != right?.data {
            return false
        }

        return isSymmetricWork(left: left?.left, right: right?.right) &&
        isSymmetricWork(left: left?.right, right: right?.left)
    }
}
