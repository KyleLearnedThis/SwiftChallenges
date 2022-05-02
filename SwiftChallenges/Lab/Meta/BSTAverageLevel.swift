//
//  BSTAverageLevel.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/2/22.
//  https://leetcode.com/problems/average-of-levels-in-binary-tree/

import Foundation

class BSTAverageLevel {
    static func bfs(_ root: TreeNode<Int>?) -> [Double] {
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

    static func dfs(_ root: TreeNode<Int>?) -> [Double] {
        var result = [Double]()
        var map = [Int: [Int]]()

        dfsWork(0, root, &map)

        let list = map.sorted { $0.0 < $1.0 }

        for item in list {
            let key = item.key
            let value = item.value
            print("[\(key)]->[\(value)] ")
            let currentAverage = value.reduce(0,+) / value.count
            result.append(Double(currentAverage))
        }

        return result
    }

    static func dfsWork(_ level: Int, _ node: TreeNode<Int>?, _ map: inout [Int: [Int]]) {
        if node == nil {
            return
        }

        var levelList: [Int] = map[level, default: [Int]()]
        let data = node!.data
        levelList.append(data)
        map[level] = levelList

        dfsWork(level+1, node?.left, &map)
        dfsWork(level+1, node?.right, &map)

    }

    static func height(node: TreeNode<Int>?) -> Int {
        if node == nil {
            return 0
        } else {
            let left = node?.left
            let right = node?.right
            let lheight = height(node: left)
            let rheight = height(node: right)

            if lheight > rheight {
                return lheight + 1
            } else {
                return rheight + 1
            }
        }
    }
}
