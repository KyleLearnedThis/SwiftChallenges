//
//  BSTLowestCommonAncestorTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 6/6/22.
//

import XCTest

class BSTLowestCommonAncestorTest: XCTestCase {
    func testBasic01() throws {
        let tree = BinarySearchTree<Int>()
        let input = [6,2,8,0,4,3,5,7,9]
        tree.insert(input: input)
        BinaryTreePrinter.printNode(root: tree.root!)
        let expected = 6
        let p = tree.search(searchValue: 2)
        let q = tree.search(searchValue: 8)

        let lca = BSTLowestCommonAncestor()
        let actual = lca.lowestCommonAncestor(tree.root, p, q)
        XCTAssertEqual(expected, actual!.data)
    }
}
