//
//  ReshapeMatrixTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 7/13/22.
//

import XCTest

class ReshapeMatrixTest: XCTestCase {
    func testBasic01() throws {
        let input = [[1,2],[3,4]]
        let r = 1
        let c = 4
        let expected = [[1,2,3,4]]
        let actual = ReshapeMatrix.matrixReshape(input, r, c)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let input = [[1,2,3],[4,5,6]]
        let r = 3
        let c = 2
        let expected = [[1,2],[3,4],[5,6]]
        let actual = ReshapeMatrix.matrixReshape(input, r, c)
        XCTAssertEqual(expected, actual)
    }
}
