//
//  HeightBalancedTreeTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class HeightBalancedTreeTest: XCTestCase {
    func testBasic01() throws {
        let x = [1,2,3,4,5,6,7,8,9,10,11]
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: x)
        BinaryTreePrinter.printNode(root: root!)
    }

    func testBasic02() throws {
        let x = [1,2,3,4,5,6,7]
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: x)
        BinaryTreePrinter.printNode(root: root!)
    }
}
