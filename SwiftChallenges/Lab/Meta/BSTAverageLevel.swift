//
//  BSTAverageLevel.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/2/22.
//  https://leetcode.com/problems/average-of-levels-in-binary-tree/

import Foundation

class BSTAverageLevel {
    static func averageOfLevels(_ root: TreeNode<Int>?) -> [Double] {
        var result = [Double]()
        var queue = [TreeNode<Int>?]()

        if root == nil {
            return result
        }
        queue.append(root)

        while !queue.isEmpty {
            let size = Double(queue.count)
            var sum: Double = 0
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                sum += Double(cur!.data)

                if let left = cur?.left {
                    queue.append(left)
                }
                if let right = cur?.right {
                    queue.append(right)
                }
            }
            result.append(sum/size)
        }

        return result
    }
}
