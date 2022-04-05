//
//  AllPathTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class AllPathsTest: XCTestCase {

    func testAllPathsBasic() {
        let input = [1,2,3,4,5,6,7,8,9,10,11]
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: input)
        BinaryTreePrinter.printNode(root: root!)
        let allPaths = AllPaths()
        _ = allPaths.binaryTreePaths(root: root)
    }
    
}
