//
//  BinaryTreeLevelOrderTraversal.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/12/26.
//  https://leetcode.com/problems/binary-tree-level-order-traversal/

class BinaryTreeLevelOrderTraversal {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let root else { return result }
        var queue: [TreeNode] = [root]

        // BFS guarantees all nodes at depth N are enqueued before any at depth N+1.
        // So queue.count at the top of each outer loop is exactly the width of the
        // next unprocessed level — draining that many nodes naturally covers one full
        // level without any explicit boundary marker.
        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0..<queue.count { // count is captured once; children appended inside don't affect it
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            result.append(level)
        }
        return result
    }
}
