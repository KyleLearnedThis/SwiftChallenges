//
//  SingleNumberTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class SingleNumberTest: XCTestCase {

    func testBasic() {
        let input = [5,4,4,3,3,2,2,1,1]
        let sn = SingleNumber()
        let actual = sn.singleNumber(input)
        let expected = 5
        XCTAssertEqual(expected, actual)
    }

}
