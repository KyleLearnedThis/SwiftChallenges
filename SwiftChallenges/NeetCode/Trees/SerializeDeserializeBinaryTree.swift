//
//  SerializeDeserializeBinaryTree.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/12/26.
//  https://leetcode.com/problems/serialize-and-deserialize-binary-tree/

class SerializeDeserializeBinaryTree {
    func serialize(_ root: TreeNode?) -> String {
        var tokens: [String] = []
        dfsSerialize(root, &tokens)
        return tokens.joined(separator: ",")
    }

    private func dfsSerialize(_ node: TreeNode?, _ tokens: inout [String]) {
        guard let node else { tokens.append("N"); return }
        tokens.append(String(node.val))
        dfsSerialize(node.left, &tokens)
        dfsSerialize(node.right, &tokens)
    }

    func deserialize(_ data: String) -> TreeNode? {
        var tokens = data.split(separator: ",", omittingEmptySubsequences: false).map(String.init)
        var index = 0
        return dfsDeserialize(&tokens, &index)
    }

    private func dfsDeserialize(_ tokens: inout [String], _ index: inout Int) -> TreeNode? {
        guard index < tokens.count else { return nil }
        let token = tokens[index]
        index += 1
        if token == "N" { return nil }
        let node = TreeNode(Int(token)!)
        node.left  = dfsDeserialize(&tokens, &index)
        node.right = dfsDeserialize(&tokens, &index)
        return node
    }
}
