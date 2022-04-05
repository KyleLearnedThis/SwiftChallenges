//
//  LargestMissingNumberTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 9/3/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class LargestMissingNumberTest: XCTestCase {
    func test01() throws {
        let input = [1, 3, 6, 4, 1, 2]
        let expected = 5
        let actual = LargestMissingNumber.largest(input)
        XCTAssertEqual(expected, actual)
    }

    func test02() throws {
        let input = [1, 2, 3]
        let expected = 4
        let actual = LargestMissingNumber.largest(input)
        XCTAssertEqual(expected, actual)
    }

    func test03() throws {
        let input = [-1, -3]
        let expected = 1
        let actual = LargestMissingNumber.largest(input)
        XCTAssertEqual(expected, actual)
    }
}
