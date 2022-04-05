//
//  DuplicateZerosTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class DuplicateZerosTest: XCTestCase {

    func testBasic() {
        var input = [1,0,2,3,0,4,5,0]
        let expected = [1,0,0,2,3,0,0,4]
        let dup = DuplicateZeros()
        dup.duplicateZeros(&input)
        XCTAssertEqual(input, expected)
    }

}
