//
//  ComputeStringSumTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 1/19/22.
//  Copyright © 2022 kylelearnedthis. All rights reserved.
//

import XCTest

class ComputeStringSumTest: XCTestCase {

    func testBasic() throws {
        let input = "excellent"
        let expected = 100
        let actual = ComputeStringSum.calculateSum(input)
        XCTAssertEqual(expected, actual)
    }

    func testLongString() throws {
        let input = "microspectrophotometries"
        let expected = 317
        let actual = ComputeStringSum.calculateSum(input)
        XCTAssertEqual(expected, actual)
    }
}
