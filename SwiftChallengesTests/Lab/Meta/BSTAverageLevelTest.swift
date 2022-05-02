//
//  BSTAverageLevelTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/2/22.
//

import XCTest

class BSTAverageLevelTest: XCTestCase {
    func testBasicV01() throws {
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: [1,2,3,4,5,6,7])
        BinaryTreePrinter.printNode(root: root!)
        let expected = [4.0, 4.0, 4.0]
        let actual = BSTAverageLevel.averageOfLevels(root)
        XCTAssertEqual(expected, actual)
    }
}
