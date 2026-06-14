//
//  NeetCloneGraphTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/13/26.
//

import XCTest

class NeetCloneGraphTest: XCTestCase {

    private let sut = NeetCloneGraph()

    // MARK: - Helpers

    // Build graph from 1-indexed adjacency list (LeetCode format)
    private func buildGraph(_ adjList: [[Int]]) -> GraphNode? {
        guard !adjList.isEmpty else { return nil }
        var nodes = [Int: GraphNode]()
        for i in 1...adjList.count {
            nodes[i] = GraphNode(i)
        }
        for (i, neighbors) in adjList.enumerated() {
            nodes[i + 1]!.neighbors = neighbors.map { nodes[$0] }
        }
        return nodes[1]
    }

    // BFS to collect all reachable nodes keyed by val
    private func collectNodes(_ node: GraphNode?) -> [Int: GraphNode] {
        guard let node else { return [:] }
        var visited = [Int: GraphNode]()
        var queue = [node]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            guard visited[current.val] == nil else { continue }
            visited[current.val] = current
            for case let neighbor? in current.neighbors where visited[neighbor.val] == nil {
                queue.append(neighbor)
            }
        }
        return visited
    }

    // Asserts the clone is a structurally identical deep copy with no shared references
    private func assertValidClone(original: GraphNode?, clone: GraphNode?) {
        let origNodes = collectNodes(original)
        let cloneNodes = collectNodes(clone)

        XCTAssertEqual(origNodes.count, cloneNodes.count)

        for (val, origNode) in origNodes {
            guard let cloneNode = cloneNodes[val] else {
                XCTFail("Clone missing node \(val)"); continue
            }
            XCTAssertFalse(origNode === cloneNode, "Node \(val) is the same reference as original")
            XCTAssertEqual(
                origNode.neighbors.compactMap { $0?.val }.sorted(),
                cloneNode.neighbors.compactMap { $0?.val }.sorted()
            )
            for case let neighbor? in cloneNode.neighbors {
                XCTAssertFalse(
                    origNodes.values.contains(where: { $0 === neighbor }),
                    "Clone node \(val)'s neighbor \(neighbor.val) still points to an original node"
                )
            }
        }
    }

    // MARK: - Base cases

    func testNilInput() {
        XCTAssertNil(sut.cloneGraph(nil))
    }

    func testSingleNodeNoNeighbors() {
        let node = GraphNode(1)
        let clone = sut.cloneGraph(node)
        XCTAssertNotNil(clone)
        XCTAssertEqual(clone?.val, 1)
        XCTAssertEqual(clone?.neighbors.count, 0)
        XCTAssertFalse(node === clone!)
    }

    // MARK: - LeetCode examples

    // adjList = [[2,4],[1,3],[2,4],[1,3]]
    func testExample1FourNodes() {
        let original = buildGraph([[2, 4], [1, 3], [2, 4], [1, 3]])
        assertValidClone(original: original, clone: sut.cloneGraph(original))
    }

    // adjList = [[]] — single node, no neighbors
    func testExample2SingleNodeEmptyNeighbors() {
        let original = buildGraph([[]])
        let clone = sut.cloneGraph(original)
        XCTAssertNotNil(clone)
        XCTAssertEqual(clone?.val, 1)
        XCTAssertEqual(clone?.neighbors.count, 0)
        assertValidClone(original: original, clone: clone)
    }

    // MARK: - Graph structures

    func testTwoNodesConnected() {
        // 1 ↔ 2
        let original = buildGraph([[2], [1]])
        assertValidClone(original: original, clone: sut.cloneGraph(original))
    }

    func testLinearChain() {
        // 1 — 2 — 3
        let original = buildGraph([[2], [1, 3], [2]])
        assertValidClone(original: original, clone: sut.cloneGraph(original))
    }

    func testTriangle() {
        // 1 ↔ 2 ↔ 3 ↔ 1
        let original = buildGraph([[2, 3], [1, 3], [1, 2]])
        assertValidClone(original: original, clone: sut.cloneGraph(original))
    }

    func testFullyConnectedFourNodes() {
        let original = buildGraph([[2, 3, 4], [1, 3, 4], [1, 2, 4], [1, 2, 3]])
        assertValidClone(original: original, clone: sut.cloneGraph(original))
    }

    func testStarGraph() {
        // Node 1 is hub connected to 2, 3, 4, 5
        let original = buildGraph([[2, 3, 4, 5], [1], [1], [1], [1]])
        assertValidClone(original: original, clone: sut.cloneGraph(original))
    }

    // MARK: - Deep copy integrity

    func testMutatingCloneValueDoesNotAffectOriginal() {
        let original = buildGraph([[2], [1]])
        let clone = sut.cloneGraph(original)
        clone?.val = 99
        XCTAssertEqual(original?.val, 1)
    }

    func testCloneNodeCountMatchesOriginal() {
        let original = buildGraph([[2, 4], [1, 3], [2, 4], [1, 3]])
        let clone = sut.cloneGraph(original)
        XCTAssertEqual(collectNodes(original).count, collectNodes(clone).count)
    }
}
