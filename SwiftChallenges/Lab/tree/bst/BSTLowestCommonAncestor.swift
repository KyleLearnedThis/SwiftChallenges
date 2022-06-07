//
//  BSTLowestCommonAncestor.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/6/22.
//  https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

import Foundation

class BSTLowestCommonAncestor {
    func lowestCommonAncestor(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {

        let parentVal = root!.data
        let pVal = p!.data
        let qVal = q!.data

        if pVal > parentVal && qVal > parentVal {
            return lowestCommonAncestor(root?.right, p, q)
        } else if pVal < parentVal && qVal < parentVal {
            return lowestCommonAncestor(root?.left, p, q)
        } else {
            return root
        }
    }
}
