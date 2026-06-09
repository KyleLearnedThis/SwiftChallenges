//
//  BSTInversion.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BSTInversion {
    public var root: BSTNode<Int>?
    public init(node: BSTNode<Int>? = nil) {
        self.root = node
    }

    public func inversion(node: BSTNode<Int>?) -> BSTNode<Int>? {
        if node != nil {
            helper(node: node)
        }
        return node
    }

    private func helper(node: BSTNode<Int>?) {
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
