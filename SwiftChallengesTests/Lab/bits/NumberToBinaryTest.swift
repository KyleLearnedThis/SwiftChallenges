//
//  NumberToBinaryTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class NumberToBinaryTest: XCTestCase {

    func testCase01() {
        let x = 4
        let nb = NumberToBinary()
        let actual = nb.toBinary(input: x)
        let expected = "100"
        XCTAssertEqual(expected, actual)
    }

    func testCase02() {
        let x = 7
        let nb = NumberToBinary()
        let actual = nb.toBinary(input: x)
        let expected = "111"
        XCTAssertEqual(expected, actual)
    }

}
