//
//  ProductSumDifferenceTest.swift
//  SwiftCodesTests
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import XCTest

class ProductSumDifferenceTest: XCTestCase {

    func testExample() {
        let input = 234
        let actual = ProductSumDifference.subtractProductAndSum(input)
        let expected = 15
        XCTAssertEqual(actual, expected)
    }

}
