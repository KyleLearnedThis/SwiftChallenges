//
//  BalanceBSTTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/4/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import XCTest

class BalanceBSTTest: XCTestCase {
    func testBasic() throws {
        let input = [1,2,3,4]
        let tree = BinarySearchTree(input: input)
        let root = tree.getRoot()!
        BinaryTreePrinter.printNode(root: root)
        let balancer = BalanceBST()
        let result = balancer.balanceBST(root)
        BinaryTreePrinter.printNode(root: result!)
    }
}
