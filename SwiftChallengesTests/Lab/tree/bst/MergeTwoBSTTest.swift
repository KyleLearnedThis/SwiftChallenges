//
//  MergeTwoBSTTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/2/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//
import XCTest

class MergeTwoBSTTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasic() throws {
        let l = initFirstBinaryTree()
        print("==== first tree ====")
        BinaryTreePrinter.printNode(root: l!)
        print("==== second tree ====")
        let r = initSecondBinaryTree()
        BinaryTreePrinter.printNode(root: r!)
        print("==== result ====")
        let merge = MergeTwoBST()
        let n = merge.mergeTrees(l, r)
        BinaryTreePrinter.printNode(root: n!)
    }

    func initFirstBinaryTree() -> TreeNode<Int>? {
        let t1 = TreeNode<Int>(data: 1)
        let t2 = TreeNode<Int>(data: 2)
        let t3 = TreeNode<Int>(data: 3)
        let t5 = TreeNode<Int>(data: 5)
        t1.left = t3
        t1.right = t2
        t3.left = t5
        return t1
    }

    func initSecondBinaryTree() -> TreeNode<Int>? {
        let t1 = TreeNode<Int>(data: 1)
        let t2 = TreeNode<Int>(data: 2)
        let t3 = TreeNode<Int>(data: 3)
        let t4 = TreeNode<Int>(data: 4)
        let t7 = TreeNode<Int>(data: 7)
        t2.left = t1
        t2.right = t3
        t1.right = t4
        t3.right = t7
        return t2
    }

}
