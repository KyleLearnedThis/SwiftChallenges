//
//  BSTInversion.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BSTInversion {
    public var root: TreeNode<Int>?
    public init(node: TreeNode<Int>? = nil) {
        self.root = node
    }

    public func inversion(node: TreeNode<Int>?) -> TreeNode<Int>? {
        if node != nil {
            helper(node: node)
        }
        return node
    }

    private func helper(node: TreeNode<Int>?) {
        let temp = node?.left
        node?.left = node?.right
        node?.right = temp

        if node?.left != nil {
            helper(node: node?.left)
        }

        if node?.right != nil {
            helper(node: node?.right)
        }
    }
    
}
