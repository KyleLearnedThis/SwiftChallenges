//
//  NeetCloneGraph.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/13/26.
//  https://leetcode.com/problems/clone-graph/

class NeetCloneGraph {
    func cloneGraph(_ node: GraphNode?) -> GraphNode? {
        var visited = [Int: GraphNode]()
        return dfs(node, visited: &visited)
    }

    private func dfs(_ node: GraphNode?, visited: inout [Int: GraphNode]) -> GraphNode? {
        guard let node else { return nil }
        // Already cloned — return existing clone to avoid infinite loop on cycles
        if let clone = visited[node.val] { return clone }
        let clone = GraphNode(node.val)
        // Register before recursing so back-edges find the clone, not nil
        visited[node.val] = clone
        clone.neighbors = node.neighbors.map { dfs($0, visited: &visited) }
        return clone
    }
}
