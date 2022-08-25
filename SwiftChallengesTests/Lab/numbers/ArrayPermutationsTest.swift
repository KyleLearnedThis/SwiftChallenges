//
//  ArrayPermutationsTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/25/22.
//

import XCTest

class ArrayPermutationsTest: XCTestCase {
    func testBasic01() throws {
        let input = [1,2,3]
        let ap = ArrayPermutations()
        let expected = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        let actual = ap.permute(input)
        XCTAssertEqual(expected, actual)
    }
}
