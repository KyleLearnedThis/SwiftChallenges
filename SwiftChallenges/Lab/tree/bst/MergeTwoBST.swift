//
//  MergeTwoBST.swift
//  SwiftCodes
//
//  Created by KyleLearnedThis on 2/2/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/merge-two-binary-trees/

import Foundation


class MergeTwoBST {
    func mergeTrees(_ t1: TreeNode<Int>?, _ t2: TreeNode<Int>?) -> TreeNode<Int>? {
        if t1 == nil {
            return t2
        }

        if t2 == nil {
            return t1
        }

        let z1 = t1!.data
        let z2 = t2!.data
        t1?.data = z1 + z2

        t1?.left = mergeTrees(t1?.left, t2?.left)
        t1?.right = mergeTrees(t1?.right, t2?.right)
        return t1
    }
}
