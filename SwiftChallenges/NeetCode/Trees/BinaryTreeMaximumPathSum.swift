//
//  BinaryTreeMaximumPathSum.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/12/26.
//  https://leetcode.com/problems/binary-tree-maximum-path-sum/

class BinaryTreeMaximumPathSum {
    // tracks the global maximum across all paths seen during DFS
    var best = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        dfs(root)
        return best
    }

    // returns the best single-arm gain this node can contribute to its parent
    @discardableResult
    func dfs(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }

        // clamp to 0: a negative subtree gain is worse than not extending into it
        let left  = max(dfs(node.left),  0)
        let right = max(dfs(node.right), 0)

        // a path that peaks at this node can use both arms; update global best
        best = max(best, node.val + left + right)

        // a path extended to the parent can only go one direction, so pick the better arm
        return node.val + max(left, right)
    }
}
