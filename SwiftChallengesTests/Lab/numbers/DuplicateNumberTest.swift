//
//  DuplicateNumberTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 2/15/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class DuplicateNumberTest: XCTestCase {
    func testBasic() throws {
        let input = [1,3,4,2,2]
        let expected = 2
        let actual = DuplicateNumber.findDuplicate(input)
        XCTAssertEqual(expected, actual)
    }
}
