//
//  CharacterCaseConversionTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class CharacterCaseConversionTest: XCTestCase {

    func testBasic() throws {
        let input = "Hello"
        let expected = "hello"
        let actual = CharacterCaseConversion.toLowerCase(input)
        XCTAssertEqual(expected, actual)
    }

}
