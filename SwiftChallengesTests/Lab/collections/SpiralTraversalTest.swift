//
//  SpiralTraversalTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 4/9/22.
//

import XCTest

class SpiralTraversalTest: XCTestCase {
    func testBasic01() throws {
        let input = [[1,2,3],[8,9,4],[7,6,5]]
        let expected = [1,2,3,4,5,6,7,8,9]
        let actual = SpiralTraversal.traversal(input)
        XCTAssertTrue(expected.count == actual.count)
        for i in actual.indices {
            if i != actual.count - 1 {
                print("[\(actual[i])]", terminator: " ")
            } else {
                print("[\(actual[i])]", terminator: "")
            }
            XCTAssertEqual(expected[i], actual[i])
        }
        print()
    }
}
