//
//  BSTMaxHeight.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BSTMaxHeight {
    public func maxDepth(root: TreeNode<Int>?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(maxDepth(root: root?.left), maxDepth(root: root?.right))
    }
}
