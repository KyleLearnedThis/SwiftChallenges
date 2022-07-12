//
//  BSTMode.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/22.
//  https://leetcode.com/problems/find-mode-in-binary-search-tree/

import Foundation

class BSTMode {
    func findMode(_ root: TreeNode<Int>?) -> [Int] {
        var dict = [Int:Int]()
        var result = [Int]()
        findModeWork(root, &dict) // traverse entire tree to build dict
        let max = dict.values.max()
        result = dict.filter {$0.value == max}.map {$0.key}
        return result
    }

    private func findModeWork(_ node: TreeNode<Int>?, _ dict: inout [Int:Int]) {
        if node == nil {
            return
        } else {
            let key = node!.data
            let value = dict[key, default: 0] + 1
            dict[key] = value
        }
        findModeWork(node?.left, &dict)
        findModeWork(node?.right, &dict)
    }
}
