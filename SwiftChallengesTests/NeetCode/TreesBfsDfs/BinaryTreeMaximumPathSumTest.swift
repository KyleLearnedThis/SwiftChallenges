//
//  BinaryTreeMaximumPathSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/12/26.
//

import XCTest

class BinaryTreeMaximumPathSumTest: XCTestCase {

    private let sut = BinaryTreeMaximumPathSum()

    // MARK: - Base cases

    func testSinglePositiveNode() {
        XCTAssertEqual(sut.maxPathSum(TreeNode(5)), 5)
    }

    func testSingleNegativeNode() {
        XCTAssertEqual(sut.maxPathSum(TreeNode(-3)), -3)
    }

    // MARK: - LeetCode examples

    // [1,2,3] → 6  (path: 2→1→3)
    func testExample1() {
        let root = TreeNode(1, TreeNode(2), TreeNode(3))
        XCTAssertEqual(sut.maxPathSum(root), 6)
    }

    // [-10,9,20,null,null,15,7] → 42  (path: 15→20→7, bypasses root)
    func testExample2() {
        let root = TreeNode(-10,
                            TreeNode(9),
                            TreeNode(20, TreeNode(15), TreeNode(7)))
        XCTAssertEqual(sut.maxPathSum(root), 42)
    }

    // MARK: - Path selection

    // Negative child is skipped; path is root + positive child only
    func testSkipsNegativeChild() {
        //    5
        //   / \
        //  -1   4
        let root = TreeNode(5, TreeNode(-1), TreeNode(4))
        XCTAssertEqual(sut.maxPathSum(root), 9)
    }

    // All negatives — must pick the single least-negative node
    func testAllNegatives() {
        //   -1
        //   / \
        // -2  -3
        let root = TreeNode(-1, TreeNode(-2), TreeNode(-3))
        XCTAssertEqual(sut.maxPathSum(root), -1)
    }

    // Best path is entirely within a subtree, not through the root
    func testBestPathInSubtree() {
        //        -10
        //        /  \
        //       5    8
        //            \
        //            12
        // Best: 8→12 = 20
        let root = TreeNode(-10,
                            TreeNode(5),
                            TreeNode(8, nil, TreeNode(12)))
        XCTAssertEqual(sut.maxPathSum(root), 20)
    }

    // Best path passes through a non-root node connecting its two children
    func testPathThroughNonRootNode() {
        //      1
        //     / \
        //    2   3
        //   / \
        //  4   5
        // Best: 4→2→5 = 11
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4), TreeNode(5)),
                            TreeNode(3))
        XCTAssertEqual(sut.maxPathSum(root), 11)
    }

    // Left-skewed chain — best path runs the full length
    func testSkewedLeft() {
        //  1
        //  |
        //  2
        //  |
        //  3
        // Best: 1+2+3 = 6
        let root = TreeNode(1, TreeNode(2, TreeNode(3), nil), nil)
        XCTAssertEqual(sut.maxPathSum(root), 6)
    }

    // Right-skewed chain
    func testSkewedRight() {
        let root = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
        XCTAssertEqual(sut.maxPathSum(root), 6)
    }

    // MARK: - Values

    func testAllZeros() {
        let root = TreeNode(0, TreeNode(0), TreeNode(0))
        XCTAssertEqual(sut.maxPathSum(root), 0)
    }

    func testMixedPositiveNegative() {
        //     2
        //    / \
        //  -1   0
        // Best: just root = 2 (right child adds nothing, left hurts)
        let root = TreeNode(2, TreeNode(-1), TreeNode(0))
        XCTAssertEqual(sut.maxPathSum(root), 2)
    }
}
