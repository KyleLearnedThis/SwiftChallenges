//
//  InvertBinaryTreeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/8/26.
//

import XCTest

class InvertBinaryTreeTest: XCTestCase {

    private let sut = InvertBinaryTree()

    // BFS level-order → [Int?], matching LeetCode array notation
    private func toArray(_ root: TreeNode?) -> [Int?] {
        guard let root else { return [] }
        var result: [Int?] = []
        var queue: [TreeNode?] = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node?.val)
            if let node {
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        // strip trailing nils — result.last is Int?? so `== nil` checks outer optional, not element
        while let last = result.last, last == nil { result.removeLast() }
        return result
    }

    // MARK: - Base cases

    func testNilRoot() {
        XCTAssertNil(sut.invertTree(nil))
    }

    func testSingleNode() {
        let root = TreeNode(1)
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [1])
    }

    // MARK: - LeetCode examples

    // [4,2,7,1,3,6,9] → [4,7,2,9,6,3,1]
    func testExample1() {
        let root = TreeNode(4,
                            TreeNode(2, TreeNode(1), TreeNode(3)),
                            TreeNode(7, TreeNode(6), TreeNode(9)))
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [4, 7, 2, 9, 6, 3, 1])
    }

    // [2,1,3] → [2,3,1]
    func testExample2() {
        let root = TreeNode(2, TreeNode(1), TreeNode(3))
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [2, 3, 1])
    }

    // MARK: - Skewed trees

    // Left-only chain becomes right-only chain
    func testSkewedLeft() {
        let root = TreeNode(1, TreeNode(2, TreeNode(3), nil), nil)
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [1, nil, 2, nil, 3])
    }

    // Right-only chain becomes left-only chain
    func testSkewedRight() {
        let root = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [1, 2, nil, 3])
    }

    // MARK: - Structural correctness

    // Root is preserved, only children swapped
    func testRootValueUnchanged() {
        let root = TreeNode(42, TreeNode(1), TreeNode(2))
        let result = sut.invertTree(root)
        XCTAssertEqual(result?.val, 42)
    }

    // Left-only node moves to right
    func testLeftChildMovesToRight() {
        let root = TreeNode(1, TreeNode(2), nil)
        let result = sut.invertTree(root)
        XCTAssertNil(result?.left)
        XCTAssertEqual(result?.right?.val, 2)
    }

    // Right-only node moves to left
    func testRightChildMovesToLeft() {
        let root = TreeNode(1, nil, TreeNode(2))
        let result = sut.invertTree(root)
        XCTAssertEqual(result?.left?.val, 2)
        XCTAssertNil(result?.right)
    }

    // MARK: - Deep trees

    // Perfect 3-level tree
    func testPerfectThreeLevelTree() {
        //        1               →        1
        //       / \                      / \
        //      2   3                    3   2
        //     / \ / \                  / \ / \
        //    4  5 6  7                7  6 5  4
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4), TreeNode(5)),
                            TreeNode(3, TreeNode(6), TreeNode(7)))
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [1, 3, 2, 7, 6, 5, 4])
    }

    // Invert twice → back to original
    func testDoubleInvertRestoresOriginal() {
        let root = TreeNode(4,
                            TreeNode(2, TreeNode(1), TreeNode(3)),
                            TreeNode(7, TreeNode(6), TreeNode(9)))
        let once = sut.invertTree(root)
        let twice = sut.invertTree(once)
        XCTAssertEqual(toArray(twice), [4, 2, 7, 1, 3, 6, 9])
    }

    // Negative values
    func testNegativeValues() {
        let root = TreeNode(-1, TreeNode(-2), TreeNode(-3))
        let result = sut.invertTree(root)
        XCTAssertEqual(toArray(result), [-1, -3, -2])
    }
}
