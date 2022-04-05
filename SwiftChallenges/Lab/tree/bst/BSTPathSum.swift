//
//  BSTPathSum.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  https://leetcode.com/problems/path-sum/

import Foundation

class BSTPathSum {
    func pathSum(_ root: TreeNode<Int>?, sum: Int) -> Array<Array<Int>> {
        var result = Array<Array<Int>>()
        if root == nil {
            return result
        }

        var list = [Int]()
        let value = root!.data
        list.append(value)

        dfs(node: root, sum: sum - value, result: &result, list: &list)
        return result
    }

    func dfs(node: TreeNode<Int>?, sum: Int, result: inout Array<Array<Int>>, list: inout Array<Int>) {
        let left = node?.left
        let right = node?.right

        if left == nil && right == nil && sum == 0 {
            let temp = [Int](list)
            result.append(temp)
        }

        /// Search path of left node
        if left != nil {
            var leftList = [Int](list)
            let value = left!.data
            leftList.append(value)
            dfs(node: left, sum: sum - value, result: &result, list: &leftList)
        }

        /// Search path of right node
        if right != nil {
            var rightList = [Int](list)
            let value = right!.data
            rightList.append(value)
            dfs(node: right, sum: sum - value, result: &result, list: &rightList)
        }
    }

    func hasPathSum(_ node: TreeNode<Int>?,_ sum: Int) -> Bool {
        let result = pathSum(node, sum: sum)
        return result.count >= 1
    }

    func printAllPaths(paths: Array<Array<Int>>) {
        for i in paths.indices {
            let array = paths[i]
            for j in array {
                print("\(j) ", terminator: " ")
            }
            print("")
        }
    }
}
