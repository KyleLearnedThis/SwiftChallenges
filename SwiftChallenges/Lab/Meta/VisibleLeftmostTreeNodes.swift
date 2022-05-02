//
//  VisibleLeftmostTreeNodes.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 5/1/22.
//  https://www.techiedelight.com/print-left-view-of-binary-tree/

import Foundation


class WidgetNode: TreeNode<Int> {
    init(_ data: Int, left: WidgetNode? = nil, right: WidgetNode? = nil) {
        super.init(data: data, leftNode: left, rightNode: right)
    }
}

extension WidgetNode {
    var visibleNodes: Int {
        let result = leftViewCount(node: self)
        return result
    }

    func leftViewCount(node: WidgetNode?) -> Int {
        var result = 0
        if node == nil {
            return 0
        }
        var queue = [TreeNode<Int>?]()
        queue.append(node)
        var cur: TreeNode<Int>? = nil
        while !queue.isEmpty {
            let size = queue.count
            var i = 0

            while i < size {
                cur = queue.removeFirst()!
                i += 1
                if i == 1 {
                    let data = String(describing: cur!.data)
                    print("[\(data)]", terminator: " ")
                    result += 1
                }

                let left = cur?.left
                let right = cur?.right
                if left != nil {
                    queue.append(left)
                }
                if right != nil {
                    queue.append(right)
                }
            }
        }
        print()

        return result
    }
}

class VisibleLeftmostTreeNodes {
    // Stub only
}
