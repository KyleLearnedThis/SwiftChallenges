//
//  UnivaluedBinaryTree.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/univalued-binary-tree/


class UnivaluedBinaryTree<T: Comparable> {
    var list: [T] = [T]()

    func isUnivalueTree(_ root: TreeNode<T>?) -> Bool {
        return isUnivalueTreeRecursion(root)
    }

    func isUnivalueTreeRecursion(_ root: TreeNode<T>?) -> Bool {
        dfs(node: root)

        for i in list.indices {
            let first = list[0]
            let cur = list[i]
            if first != cur {
                return false
            }
        }

        return true
    }

    private func dfs(node: TreeNode<T>?) {
        if node != nil {
            list.append(node!.data)
            dfs(node: node?.left)
            dfs(node: node?.right)
        }
    }

}
