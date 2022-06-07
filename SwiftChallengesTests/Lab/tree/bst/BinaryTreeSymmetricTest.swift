//
//  BinaryTreeSymmetricTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/7/22.
//

import XCTest

class BinaryTreeSymmetricTest: XCTestCase {
    func testBasic01() throws {
        let root = TreeNode(data: 1)
        let a1 = TreeNode(data: 2)
        let a2 = TreeNode(data: 2)
        let b1 = TreeNode(data: 3)
        let b2 = TreeNode(data: 3)
        root.left = a1
        root.right = a2
        a1.left = b1
        a2.right = b2
        BinaryTreePrinter.printNode(root: root)

        let expected = true
        let bts = BinaryTreeSymmetric()
        let actual = bts.isSymmetric(root)
        XCTAssertEqual(expected, actual)
    }
}
