//
//  SerializeDeserializeBinaryTreeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/12/26.
//

import XCTest

class SerializeDeserializeBinaryTreeTest: XCTestCase {

    private let sut = SerializeDeserializeBinaryTree()

    private func assertRoundTrip(_ root: TreeNode?, file: StaticString = #filePath, line: UInt = #line) {
        let serialized = sut.serialize(root)
        let reserialized = sut.serialize(sut.deserialize(serialized))
        XCTAssertEqual(serialized, reserialized, file: file, line: line)
    }

    // MARK: - Base cases

    func testNilRoot() {
        assertRoundTrip(nil)
    }

    func testSingleNode() {
        assertRoundTrip(TreeNode(1))
    }

    // MARK: - LeetCode examples

    // [1,2,3,4,5] → round-trips to same structure
    func testExample1() {
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4), TreeNode(5)),
                            TreeNode(3))
        assertRoundTrip(root)
    }

    // MARK: - Structure

    func testSkewedLeft() {
        //   1
        //  /
        // 2
        //  \
        //   3
        let root = TreeNode(1, TreeNode(2, nil, TreeNode(3)), nil)
        assertRoundTrip(root)
    }

    func testSkewedRight() {
        let root = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3)))
        assertRoundTrip(root)
    }

    func testSparseTree() {
        //      1
        //     / \
        //    2   3
        //         \
        //          4
        let root = TreeNode(1,
                            TreeNode(2),
                            TreeNode(3, nil, TreeNode(4)))
        assertRoundTrip(root)
    }

    func testFourLevels() {
        //         1
        //        / \
        //       2   3
        //      / \   \
        //     4   5   6
        //    /
        //   7
        let root = TreeNode(1,
                            TreeNode(2, TreeNode(4, TreeNode(7), nil), TreeNode(5)),
                            TreeNode(3, nil, TreeNode(6)))
        assertRoundTrip(root)
    }

    // MARK: - Values

    func testNegativeValues() {
        let root = TreeNode(-1, TreeNode(-2), TreeNode(-3))
        assertRoundTrip(root)
    }

    func testDuplicateValues() {
        let root = TreeNode(5, TreeNode(5), TreeNode(5))
        assertRoundTrip(root)
    }

    func testZeroValues() {
        let root = TreeNode(0, TreeNode(0), nil)
        assertRoundTrip(root)
    }
}
