//
//  BSTModeTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/12/22.
//

import XCTest

class BSTModeTest: XCTestCase {
    func testBasic01() throws {
        let input = [0]
        let bst = BinarySearchTree(input: input)
        let root = bst.root
        BinaryTreePrinter.printNode(root: root!)
        let mode = BSTMode()
        let expected = [0]
        let actual = mode.findMode(root)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let root = TreeNode<Int>(data: 1)
        let t1 = TreeNode<Int>(data: 2)
        let t2 = TreeNode<Int>(data: 2)
        root.right = t1
        t1.left = t2
        BinaryTreePrinter.printNode(root: root)
        let mode = BSTMode()
        let expected = [2]
        let actual = mode.findMode(root)
        XCTAssertEqual(expected, actual)
    }

    func testBasic03() throws {
        let root = TreeNode<Int>(data: 1)
        let t1 = TreeNode<Int>(data: 2)
        root.right = t1
        BinaryTreePrinter.printNode(root: root)
        let mode = BSTMode()
        let expected = Set([1,2])
        let actual = mode.findMode(root)
        let actualSet = Set(actual)
        XCTAssertEqual(expected, actualSet)
    }
}
