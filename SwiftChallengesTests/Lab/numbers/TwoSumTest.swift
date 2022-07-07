//
//  TwoSumTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/14/22.
//

import XCTest

class TwoSumTest: XCTestCase {
    func testBasic01() throws {
        let input = [2,7,11,15]
        let target = 9
        let actual = TwoSum.twoSum(input, target)
        let expected = [0,1]
        XCTAssertEqual(expected, actual)
    }

    func testSumsBasic01() throws {
        let input = [3,6,2,7,11,15, -2]
        let target = 9
        let actual = TwoSum.twoSums(input, target)
        let expected = [[0,1], [2,3], [4,6]]

        for i in actual.indices {
            let a1 = actual[i]
            let e1 = expected[i]
            XCTAssertEqual(a1, e1)
        }
    }

    func testBST01() throws {
        let input = [5,3,2,6,4,7]
        let bst = BinarySearchTree(input: input)
        let root = bst.root!
        BinaryTreePrinter.printNode(root: root)
        let ts = TwoSum()
        let k = 9
        let expected = true
        let actual = ts.findTarget(root, k)
        XCTAssertEqual(actual, expected)
    }

    func testBST02() throws {
        let input = [5,3,2,6,4,7]
        let bst = BinarySearchTree(input: input)
        let root = bst.root!
        BinaryTreePrinter.printNode(root: root)
        let ts = TwoSum()
        let k = 28
        let expected = false
        let actual = ts.findTarget(root, k)
        XCTAssertEqual(actual, expected)
    }
}
