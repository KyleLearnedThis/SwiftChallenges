//
//  BSTKthElementTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/4/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class BSTKthElementTest: XCTestCase {

    func testBasic() throws {
        let input = [5,6,3,4,2,1]
        let k = 3
        let expected = 3
        let tree = BinarySearchTree<Int>(input: input)
        let root = tree.getRoot()
        BinaryTreePrinter.printNode(root: root!)
        let kth = BSTKthElement()
        let actual = kth.kthSmallest(root, k)
        XCTAssertEqual(expected, actual)
    }

}
