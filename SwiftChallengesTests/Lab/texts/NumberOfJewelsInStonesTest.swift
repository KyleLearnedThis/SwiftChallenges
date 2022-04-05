//
//  NumberOfJewelsInStonesTest.swift
//  SwiftCodesTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class NumberOfJewelsInStonesTest: XCTestCase {

    func testBasic() {
        let njst = NumberOfJewelsInStones()
        let actual = njst.numJewelsInStones("aA", "aAAbbbb")
        let expected = 3
        XCTAssertEqual(expected, actual)
    }

}
