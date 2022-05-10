//
//  BSTAverageLevelTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 5/2/22.
//

import XCTest

class BSTAverageLevelTest: XCTestCase {
    func testBasicBFS01() throws {
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: [1,2,3,4,5,6,7])
        BinaryTreePrinter.printNode(root: root!)
        let expected = [4.0, 4.0, 4.0]
        let actual = BSTAverageLevel.bfs(root)
        XCTAssertEqual(expected, actual)
    }

    func testBasicDFS01() throws {
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: [1,2,3,4,5,6,7])
        BinaryTreePrinter.printNode(root: root!)
        let expected = [4.0, 4.0, 4.0]
        let actual = BSTAverageLevel.dfs(root)
        XCTAssertEqual(expected, actual)
    }

    func testBSTHeight01() throws {
        let tree = HeightBalancedTree()
        let root = tree.sortedArrayToBST(nums: [1,2,3,4,5,6,7])
        BinaryTreePrinter.printNode(root: root!)
        let expected = 3
        let actual = BSTAverageLevel.height(node: root)
        XCTAssertEqual(expected, actual)
    }
}
