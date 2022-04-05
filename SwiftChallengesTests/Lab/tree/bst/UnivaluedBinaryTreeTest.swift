//
//  UnivaluedBinaryTreeTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class UnivaluedBinaryTreeTest: XCTestCase {

    func testBasic() throws {
        let root = initUnivalueTree()
        print("===== Tree =====")
        BinaryTreePrinter.printNode(root: root!)
        let expect = true
        let ubt = UnivaluedBinaryTree<Int>()
        let actual = ubt.isUnivalueTree(root)
        XCTAssertEqual(expect, actual)
    }

    func testUniqueTree() throws {
        let root = initUniqueTree()
        print("===== Tree =====")
        BinaryTreePrinter.printNode(root: root!)
        let expect = true
        let ubt = UnivaluedBinaryTree<Int>()
        let actual = ubt.isUnivalueTree(root)
        XCTAssertNotEqual(expect, actual)
    }

    func initUnivalueTree() -> TreeNode<Int>? {
        let t1 = TreeNode<Int>(data: 1)
        let t2 = TreeNode<Int>(data: 1)
        let t3 = TreeNode<Int>(data: 1)
        let t4 = TreeNode<Int>(data: 1)
        let t7 = TreeNode<Int>(data: 1)
        t2.left = t1
        t2.right = t3
        t1.right = t4
        t3.right = t7
        return t2
    }

    func initUniqueTree() -> TreeNode<Int>? {
        let t1 = TreeNode<Int>(data: 1)
        let t2 = TreeNode<Int>(data: 2)
        let t3 = TreeNode<Int>(data: 3)
        let t4 = TreeNode<Int>(data: 4)
        let t7 = TreeNode<Int>(data: 5)
        t2.left = t1
        t2.right = t3
        t1.right = t4
        t3.right = t7
        return t2
    }
}
