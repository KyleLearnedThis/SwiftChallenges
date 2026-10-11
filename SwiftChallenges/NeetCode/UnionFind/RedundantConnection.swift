//
//  RedundantConnection.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 10/6/26.
//  https://leetcode.com/problems/redundant-connection/

class RedundantConnection {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var groups = [Set<Int>]()
        for edge in edges {
            let u = edge.first!
            let v = edge.last!
            let iu = groups.firstIndex { $0.contains(u) } // index of u
            let iv = groups.firstIndex { $0.contains(v) } // index of v
            if iu == nil && iv == nil {
                let newSet = Set(edge)
                groups.append(newSet)
            } else if iu == nil, let iv {
                groups[iv].insert(u)
            } else if iv == nil, let iu {
                groups[iu].insert(v)
            } else if iv == iu {
                return edge
            } else {
                let iu = iu!
                let iv = iv!
                groups[iu] = groups[iu].union(groups[iv])
                groups.remove(at: iv)
            }
        }
        return []
    }

    func unionFindRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var parent = Array(0...edges.count) // parent[i] = i, every node is its own root

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x]) // path compression
            }
            return parent[x]
        }

        for edge in edges {
            let rootU = find(edge[0])
            let rootV = find(edge[1])
            if rootU == rootV {
                return edge
            }
            parent[rootU] = rootV
        }
        return []
    }
}
