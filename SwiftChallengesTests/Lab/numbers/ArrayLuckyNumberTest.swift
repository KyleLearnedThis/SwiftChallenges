//
//  ArrayLuckyNumberTest.swift
//  SwiftCodesTests
//
//  Created by KyleLearnedThis on 3/24/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class ArrayLuckyNumberTest: XCTestCase {

    func testBasic() throws {
        let input = [1,2,2,3,3,3]
        let expected = 3
        let actual = ArrayLuckyNumber.findLucky(input)
        XCTAssertEqual(expected, actual)
    }

}
