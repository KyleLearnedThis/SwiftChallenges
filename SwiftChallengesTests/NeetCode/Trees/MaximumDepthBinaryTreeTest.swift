//
//  MaximumDepthBinaryTreeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/8/26.
//

import XCTest

class MaximumDepthBinaryTreeTest: XCTestCase {

    // MARK: - Base cases

    func testNilRoot() {
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(nil), 0)
    }

    func testSingleNode() {
        let root = TreeNode(1)
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 1)
    }

    // MARK: - LeetCode examples

    // [3,9,20,null,null,15,7] → 3
    func testExample1() {
        let root = TreeNode(3,
                            TreeNode(9),
                            TreeNode(20, TreeNode(15), TreeNode(7)))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 3)
    }

    // [1,null,2] → 2
    func testExample2() {
        let root = TreeNode(1, nil, TreeNode(2))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 2)
    }

    // MARK: - Skewed trees

    func testSkewedLeft() {
        let root = TreeNode(1, TreeNode(2, TreeNode(3), nil), nil)
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 3)
    }

    func testSkewedRight() {
        let root = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 3)
    }

    // MARK: - Balanced trees

    func testTwoLevelBalanced() {
        //     1
        //    / \
        //   2   3
        let root = TreeNode(1, TreeNode(2), TreeNode(3))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 2)
    }

    func testThreeLevelBalanced() {
        //        1
        //       / \
        //      2   3
        //     / \ / \
        //    4  5 6  7
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4), TreeNode(5)),
                            TreeNode(3, TreeNode(6), TreeNode(7)))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 3)
    }

    // MARK: - Unbalanced trees

    // Deeper on right subtree
    func testDeeperRight() {
        //    1
        //   / \
        //  2   3
        //       \
        //        4
        let root = TreeNode(1,
                            TreeNode(2),
                            TreeNode(3, nil, TreeNode(4)))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 3)
    }

    // Deeper on left subtree
    func testDeeperLeft() {
        //      1
        //     / \
        //    2   3
        //   /
        //  4
        // /
        // 5
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4, TreeNode(5), nil), nil),
                            TreeNode(3))
        XCTAssertEqual(MaximumDepthBinaryTree().maxDepth(root), 4)
    }
}
