//
//  CharacterExpansionTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class CharacterExpansionTest: XCTestCase {

    func testBasic01() {
        let input = "10d2ag12"
        let expected = "ddddddddddaag"
        let actual = CharacterExpansion.numberExpansion(input)
        XCTAssertEqual(expected, actual)
    }

}
