//
//  HeightCheckerTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class HeightCheckerTest: XCTestCase {

    func testBasic() {
        let input = [1,1,4,2,1,3]
        let expected = 3
        let actual = HeightChecker.heightChecker(input)
        XCTAssertEqual(expected, actual)
    }

}
