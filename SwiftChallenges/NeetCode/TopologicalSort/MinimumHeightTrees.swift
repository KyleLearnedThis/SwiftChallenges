//
//  MinimumHeightTrees.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/24/26.
//  https://leetcode.com/problems/minimum-height-trees/

class MinimumHeightTrees {

    // -------------------------------------------------------------------------
    // Topological Sort — leaf trimming (iterative)
    //
    // Summary:
    //   The MHT roots are always the 1 or 2 center nodes of the tree.
    //   We find them by repeatedly removing the current leaf layer (nodes
    //   with degree 1), like peeling an onion inward, until only the
    //   center node(s) remain. This mirrors topological sort: leaves are
    //   processed first, exposing new leaves each round.
    //
    // Time:  O(n) — each node and edge is processed at most once
    // Space: O(n) — adjacency list stores all n nodes and their edges
    // -------------------------------------------------------------------------
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        // A single node has no edges, so it is trivially the root
        if n == 1 { return [0] }

        // Build an undirected adjacency list using Sets so removal is O(1)
        var adj: [Set<Int>] = Array(repeating: Set<Int>(), count: n)
        for edge in edges {
            adj[edge[0]].insert(edge[1])
            adj[edge[1]].insert(edge[0])
        }

        // Seed the queue with all initial leaves (degree == 1)
        var queue: [Int] = []
        for node in 0..<n {
            if adj[node].count == 1 {
                queue.append(node)
            }
        }
        var remaining = n  // tracks how many nodes haven't been trimmed yet

        // Trim leaves layer by layer, like peeling an onion inward.
        // The answer is always the 1 or 2 center nodes, so stop at 2.
        while remaining > 2 {
            var nextLeaves: [Int] = []

            for leaf in queue {
                // Each leaf has exactly one neighbor from array of set — disconnect them
                let neighbor = adj[leaf].first!
                adj[neighbor].remove(leaf)

                // If the neighbor is now a leaf, it joins the next layer
                if adj[neighbor].count == 1 {
                    nextLeaves.append(neighbor)
                }
            }

            // This entire layer of leaves has been removed
            remaining -= queue.count
            queue = nextLeaves
        }

        // Whatever is left (1 or 2 nodes) are the MHT roots
        return queue
    }

    // -------------------------------------------------------------------------
    // Alternative: DFS to find the diameter path, then return its center node(s)
    //
    // Summary:
    //   The MHT roots are always the center(s) of the tree's longest path
    //   (the diameter). We find the diameter with two DFS passes:
    //     1. DFS from any node (0) → finds one end of the diameter (u)
    //     2. DFS from u → finds the other end and records the full path
    //   The middle 1 or 2 nodes of that path are the answer.
    //
    // Time:  O(n) — two DFS passes, each visits every node once
    // Space: O(n) — adjacency list + recursion stack + path storage
    // -------------------------------------------------------------------------
    func findMinHeightTreesDFS(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 { return [0] }

        // Build undirected adjacency list
        var adj: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
        }

        // DFS that tracks the current path via backtracking.
        // Keeps the longest path seen so far in bestPath.
        func dfs(node: Int, parent: Int, currentPath: inout [Int], bestPath: inout [Int]) {
            currentPath.append(node)

            if currentPath.count > bestPath.count {
                bestPath = currentPath
            }

            for neighbor in adj[node] {
                // Skip the node we came from to avoid going backwards
                if neighbor != parent {
                    dfs(node: neighbor, parent: node, currentPath: &currentPath, bestPath: &bestPath)
                }
            }

            // Backtrack: remove this node before returning to caller
            currentPath.removeLast()
        }

        // Step 1: DFS from node 0 to find one end of the diameter
        var currentPath: [Int] = []
        var bestPath: [Int] = []
        dfs(node: 0, parent: -1, currentPath: &currentPath, bestPath: &bestPath)
        let diameterStart = bestPath.last!

        // Step 2: DFS from that end to find the full diameter path
        currentPath = []
        bestPath = []
        dfs(node: diameterStart, parent: -1, currentPath: &currentPath, bestPath: &bestPath)
        let diameterPath = bestPath

        // Step 3: The center of the diameter path is the MHT root(s).
        // Odd-length path → 1 center; even-length path → 2 centers.
        let len = diameterPath.count
        if len % 2 == 1 {
            return [diameterPath[len / 2]]
        } else {
            return [diameterPath[len / 2 - 1], diameterPath[len / 2]]
        }
    }
}
