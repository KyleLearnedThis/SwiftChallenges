//
//  PerfectNumberTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 3/18/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class PerfectNumberTest: XCTestCase {

    func testBasic() throws {
        let input = 28
        let actual = PerfectNumber.checkPerfectNumber(input)
        let expected = true
        XCTAssertEqual(expected, actual)
    }

}
