//
//  BinaryTreeLevelOrderTraversalTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/12/26.
//

import XCTest

class BinaryTreeLevelOrderTraversalTest: XCTestCase {

    private let sut = BinaryTreeLevelOrderTraversal()

    // MARK: - Base cases

    func testNilRoot() {
        XCTAssertEqual(sut.levelOrder(nil), [])
    }

    func testSingleNode() {
        XCTAssertEqual(sut.levelOrder(TreeNode(1)), [[1]])
    }

    // MARK: - LeetCode examples

    // [3,9,20,null,null,15,7] → [[3],[9,20],[15,7]]
    func testExample1() {
        let root = TreeNode(3,
                            TreeNode(9),
                            TreeNode(20, TreeNode(15), TreeNode(7)))
        XCTAssertEqual(sut.levelOrder(root), [[3], [9, 20], [15, 7]])
    }

    // [1] → [[1]]
    func testExample2() {
        XCTAssertEqual(sut.levelOrder(TreeNode(1)), [[1]])
    }

    // [] → []
    func testExample3() {
        XCTAssertEqual(sut.levelOrder(nil), [])
    }

    // MARK: - Skewed trees

    // Left-only chain: each level has one node
    func testSkewedLeft() {
        let root = TreeNode(1, TreeNode(2, TreeNode(3), nil), nil)
        XCTAssertEqual(sut.levelOrder(root), [[1], [2], [3]])
    }

    // Right-only chain: each level has one node
    func testSkewedRight() {
        let root = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
        XCTAssertEqual(sut.levelOrder(root), [[1], [2], [3]])
    }

    // MARK: - Level grouping

    // Perfect 3-level tree groups all nodes by depth
    func testPerfectThreeLevelTree() {
        //        1
        //       / \
        //      2   3
        //     / \ / \
        //    4  5 6  7
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4), TreeNode(5)),
                            TreeNode(3, TreeNode(6), TreeNode(7)))
        XCTAssertEqual(sut.levelOrder(root), [[1], [2, 3], [4, 5, 6, 7]])
    }

    // Unbalanced: right subtree has an extra level
    func testUnbalancedTree() {
        //      1
        //     / \
        //    2   3
        //         \
        //          4
        let root = TreeNode(1,
                            TreeNode(2),
                            TreeNode(3, nil, TreeNode(4)))
        XCTAssertEqual(sut.levelOrder(root), [[1], [2, 3], [4]])
    }

    // Left subtree one level deeper than right
    func testLeftHeavyTree() {
        //      1
        //     / \
        //    2   3
        //   /
        //  4
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4), nil),
                            TreeNode(3))
        XCTAssertEqual(sut.levelOrder(root), [[1], [2, 3], [4]])
    }

    // MARK: - Values

    func testNegativeValues() {
        let root = TreeNode(-1, TreeNode(-2), TreeNode(-3))
        XCTAssertEqual(sut.levelOrder(root), [[-1], [-2, -3]])
    }

    func testDuplicateValues() {
        let root = TreeNode(1, TreeNode(1), TreeNode(1))
        XCTAssertEqual(sut.levelOrder(root), [[1], [1, 1]])
    }
}
