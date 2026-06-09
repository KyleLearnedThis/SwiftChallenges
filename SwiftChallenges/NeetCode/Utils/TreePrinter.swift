//
//  TreePrinter.swift
//  SwiftChallenges
//

import Foundation

public class TreePrinter {

    public static func maxLevel(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }
        return max(maxLevel(node.left), maxLevel(node.right)) + 1
    }

    public static func printTree(_ root: TreeNode?) {
        guard let root else { return }
        let maxLevel = TreePrinter.maxLevel(root)
        printInternal(nodes: [root], level: 1, maxLevel: maxLevel)
    }

    private static func printInternal(nodes: [TreeNode?], level: Int, maxLevel: Int) {
        if nodes.isEmpty || nodes.allSatisfy({ $0 == nil }) { return }

        let floor = maxLevel - level
        let edgeLines = intValue(pow(2, max(floor - 1, 0)))
        let firstSpaces = intValue(pow(2, floor)) - 1
        let betweenSpaces = intValue(pow(2, floor + 1)) - 1

        printSpaces(firstSpaces)

        var nextNodes: [TreeNode?] = []
        for node in nodes {
            if let node {
                print(node.val, terminator: " ")
                nextNodes.append(node.left)
                nextNodes.append(node.right)
            } else {
                print(" ", terminator: " ")
                nextNodes.append(nil)
                nextNodes.append(nil)
            }
            printSpaces(betweenSpaces)
        }
        print("")

        for i in 1...max(edgeLines, 1) {
            guard edgeLines > 0 else { break }
            for j in 0..<nodes.count {
                printSpaces(firstSpaces - i)
                if nodes[j] == nil {
                    printSpaces(edgeLines + edgeLines + i + 1)
                    continue
                }
                if nodes[j]?.left != nil {
                    print("/", terminator: " ")
                } else {
                    printSpaces(1)
                }
                printSpaces(i + i - 1)
                if nodes[j]?.right != nil {
                    print("\\", terminator: " ")
                } else {
                    printSpaces(1)
                }
                printSpaces(edgeLines + edgeLines - i)
            }
            print("")
        }

        printInternal(nodes: nextNodes, level: level + 1, maxLevel: maxLevel)
    }

    private static func printSpaces(_ count: Int) {
        guard count > 0 else { return }
        print(String(repeating: " ", count: count), terminator: "")
    }

    private static func intValue(_ value: Decimal) -> Int {
        return NSDecimalNumber(decimal: value).intValue
    }
}
