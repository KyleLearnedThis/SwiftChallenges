//
//  ArraySimiliarTest.swift
//  SwiftChallengesTests
//
//  Created by KyleLearnedThis on 8/4/22.
//

import XCTest

class ArraySimiliarTest: XCTestCase {
    func testBasic01() throws {
        let a = [1, 1, 4]
        let b = [1, 2, 3]
        let expected = false
        let actual = ArraySimiliar.isSimiliar(a: a, b: b)
        XCTAssertEqual(expected, actual)
    }

    func testBasic02() throws {
        let a = [832, 998, 148, 570, 533, 561, 894, 147, 455, 279]
        let b = [832, 570, 148, 998, 533, 561, 455, 147, 894, 279]
        let expected = false
        let actual = ArraySimiliar.isSimiliar(a: a, b: b)
        XCTAssertEqual(expected, actual)
    }
}
