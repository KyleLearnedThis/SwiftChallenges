//
//  ExtractNumberSumTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class ExtractNumberSumTest: XCTestCase {

    func testBasic() {
        let expected = 111
        let input = "aaa100bbb10ccc1"
        let actual = ExtractNumberSum.extractNumbers(input)
        XCTAssertEqual(expected, actual)
    }

}


