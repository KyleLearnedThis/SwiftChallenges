//
//  BSTPathSumTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class BSTPathSumTest: XCTestCase {

    func testBasic() {
        let input = [1,2,3,4,5,6,7,8,9,10,11]
        let tree = HeightBalancedTree()
        if let root = tree.sortedArrayToBST(nums: input) {
            BinaryTreePrinter.printNode(root: root)
            let bps = BSTPathSum()
            let list = bps.pathSum(root, sum: 12)
            bps.printAllPaths(paths: list)
            XCTAssertEqual(true, list.count >= 1)
        }
    }

}
