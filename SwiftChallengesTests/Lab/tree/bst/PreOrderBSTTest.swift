//
//  PreOrderBSTTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/8/22.
//

import XCTest

class PreOrderBSTTest: XCTestCase {
    func testBasic01() {
        let input = [8,5,1,7,10,12]
        let bst = PreOrderBST()
        let root = bst.bstFromPreorder(input)
        BinaryTreePrinter.printNode(root: root!)
    }
}
