//
//  EvenNumberDigitsTest.swift
//  SwiftCodesTests
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import XCTest

class EvenNumberDigitsTest: XCTestCase {

    func testExample() {
        let input = [12,345,2,6,7896]
        let expected = 2
        let actual = EvenNumberDigits.findNumbers(input)
        XCTAssertEqual(actual, expected)
    }

}
