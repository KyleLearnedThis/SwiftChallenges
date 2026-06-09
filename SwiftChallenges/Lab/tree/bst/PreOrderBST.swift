//
//  PreOrderBST.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/8/22.
//  https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/

import Foundation

class PreOrderBST {
    func bstFromPreorder(_ input: [Int]) -> BSTNode<Int>? {
        guard !input.isEmpty else { return nil }
        var root: BSTNode<Int>? = nil
        for item in input {
            push(item, &root)
        }
        return root
    }

    func push(_ item: Int, _ node: inout BSTNode<Int>?) {
        guard let cur = node else {
            node = BSTNode(data: item)
            return
        }
        if item > cur.data {
            push(item, &cur.right)
        } else if item < cur.data {
            push(item, &cur.left)
        }
    }
}
